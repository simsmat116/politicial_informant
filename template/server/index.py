# server.py
from flask import Flask, render_template, request, jsonify
import requests
import template
import csv
from newsapi import NewsApiClient
from template import app
app.debug = True

@app.route("/", methods=['GET', 'POST'])
def index():
    # print(request.get_json())
    if request.method == 'POST':
        data = request.get_json()
        if data["state"] == "registration_state_info":
            return get_register_vote(data)
        elif data["state"] == "query_candidate_info":
             return get_candidate_info(data)
        elif data["state"] == "query_polling_info":
            return get_polling(data)
        elif data["state"] == "query_polling_places":
            return get_polling_places(data)
    return render_template("index.html")

def get_register_vote(data):
    # Get the lowercased state to correctly find info in database
    state = data["slots"]["_VOTERSTATE_"]["values"][-1]["tokens"].lower()
    connection = template.server.model.get_db()

    state_code_query = connection.execute(
        """
        SELECT code
        FROM stateCode
        WHERE state LIKE ?
        """,
        (state,)
    ).fetchone()
    data["slots"]["_VOTERSTATE_"]["values"][-1]["error"] = 0
    #Check if a state code was fetched correctly, set resolved based on this
    if state_code_query is None:
        data["slots"]["_VOTERSTATE_"]["values"][-1]["error"] = 1
        data["slots"]["_VOTERSTATE_"]["values"][-1]["resolved"] = 1
        data["slots"]["_VOTERSTATE_"]["values"][-1]["value"] = "The state that was given is not a valid state in the US."
    else:
        data["slots"]["_VOTERSTATE_"]["values"][-1]["resolved"] = 1
        register_url = "vote.gov/register/" + state_code_query["code"]
        #Set value in STATE slot as url to return
        #clinc  can now use this value data in the response for front end
        data["slots"]["_VOTERSTATE_"]["values"][-1]["value"] = register_url

    return jsonify(data)

# Function for searching database to find candidate's policy
def search_candidate_info(candidate, policy=""):
    connection = template.server.model.get_db()
    if policy:
        stance_query = connection.execute(
        """
        SELECT *
        FROM policies
        WHERE policyName = ? AND candidateName LIKE ?
        """,
        (policy, candidate)
        ).fetchone()
        return stance_query

    stance_query = connection.execute(
    """
    SELECT *
    FROM candidates
    WHERE candidateName LIKE ?
    """,
    (candidate)
    ).fetchone()

    return stance_query


def query_news_api(policy1, candidate_info):
    #TODO: set policy1 data as GNews response
    newsapi = NewsApiClient(api_key='8aa3b868701944b38575f72012029949')
    all_articles = newsapi.get_everything(q=candidate_info,
                                  language='en',
                                  sort_by='relevancy',
                                  page=2)

    if all_articles["articles"]:
        print("Found articles on topic")
        print(all_articles)
        policy_descr = all_articles["articles"][0]["description"]
        policy_url = all_articles["articles"][0]["url"]

        policy1["values"][-1]["value"] = "api"
        policy1["values"][-1]["description"] = policy_descr
        policy1["values"][-1]["url"] = policy_url
    else:
        print("Did not find articles")
        policy1["values"][-1]["value"] = "api"
        policy1["values"][-1]["url"] = -1
        policy_url = "na"

    return policy_url


# Function for setting the values in the candidate portion of the response
def set_candidate_values(candidate, candidate_info):
    if candidate_info:
        print("CANDIDATE INFO: ", candidate_info)
        candidate["values"][-1]["value"] = candidate_info
        candidate["values"][-1]["error"] = 1
    return


def get_candidate_info(data):
    """Process the extracted information for query_candidate_info competency."""
    candidate1 = data["slots"].get("_CANDIDATE1_", None)
    candidate2 = data["slots"].get("_CANDIDATE2_", None)
    policy1 = data["slots"].get("_POLICY1_", None)

    print("Policy 1 ", policy1)
    print("Candidate 1 ", candidate1)
    # Return data if there is not a first candidate
    if not candidate1 or not policy1:
        return jsonify(data)

    cand1_cond = "first_candidate" not in candidate1["values"][-1]
    cand2_cond = candidate2 and "second_candidate" not in candidate2["values"][-1]

    # If first_candidate and second_candidate don't exist, then we have invalid candidates
    if cand1_cond or cand2_cond:
        # Remove all candidates from the lists so previous information is not provided.
        for cand in candidate1["values"]: cand["resolved"] = -1

        if candidate2:
            for cand in candidate2["values"]: cand["resolved"] = -1

        return jsonify(data)

    # When user asks about 'his', 'her', etc. this is mapped to PREV_CAND
    if candidate1["values"][-1]["first_candidate"] == "PREV_CAND":
        # If there is a previous candidate, then pop the entry of PREV_CAND.
        # If not, then return without setting resolved equal to 1
        if len(candidate1["values"]) > 1:
            candidate1["values"].pop()
        else:
            return jsonify(data)

    # Policy always set to resolved (either valid or query News API)
    policy1["values"][-1]["resolved"] = 1

    if policy1 and "first_policy" not in policy1["values"][-1]:
        print(policy1["values"][-1])
        # Query the News API and set appropriate information
        if (candidate1["values"][-1]["first_candidate"] == "Joseph R. Biden Jr."):
            candidate_info =  "Joe Biden AND " + policy1["values"][-1]["tokens"]
        elif (candidate1["values"][-1]["first_candidate"] == "Donald J. Trump"):
            candidate_info =  "Donald J. Trump AND " + policy1["values"][-1]["tokens"]
        elif (candidate1["values"][-1]["first_candidate"] == "Bernie Sanders"):
            candidate_info =  "Bernie Sanders AND " + policy1["values"][-1]["tokens"]
        else:
            candidate_info =  candidate1["values"][-1]["first_candidate"] + " AND " + policy1["values"][-1]["tokens"]

        policy_url = query_news_api(policy1, candidate_info)
        print("POLICY URL: ", policy_url)
        set_candidate_values(candidate1, policy_url)
        candidate1["values"][-1]["resolved"] = 1
        return jsonify(data)
    else:
        policy1["values"][-1]["value"] = ""

    # Set error for first candidate (used for determining if display should be shown)
    candidate1["values"][-1]["error"] = 0

    # When user asks about 'his', 'her', etc. this is mapped to PREV_CAND
    if candidate1["values"][-1]["first_candidate"] == "PREV_CAND":
        # If there is a previous candidate, then pop the entry of PREV_CAND.
        # If not, then return without setting resolved equal to 1
        if len(candidate1["values"]) > 1:
            candidate1["values"].pop()
        else:
            return jsonify(data)

    # Get the actual values for slots if they exist
    cand1_name = candidate1["values"][-1]["first_candidate"]
    policy1_name = policy1["values"][-1]["first_policy"] if policy1 else ""
    cand2_name = candidate2["values"][-1]["second_candidate"] if candidate2 else ""

    # Get the first candidates info and add it to the response
    candidate1_info = search_candidate_info(cand1_name, policy1_name)
    set_candidate_values(candidate1, candidate1_info)

    # Get the second candidates information and add it to response
    if candidate2 and "error" not in candidate2["values"][-1] and cand1_name != cand2_name:
        candidate2["values"][-1]["error"] = 0
        candidate2_info = search_candidate_info(cand2_name, policy1_name)
        set_candidate_values(candidate2, candidate2_info)
    elif candidate2 and "error" in candidate2["values"][-1]:
        # In the case that candidate2 exists but should not be used, error is set to 0
        candidate2["values"][-1]["error"] = 0

    candidate1["values"][-1]["resolved"] = 1
    if candidate2: candidate2["values"][-1]["resolved"] = 1

    return jsonify(data)


def get_polling(data):
    resp = data
    # Retrieve the candidate from the data (first_candidate is slot mapped field)
    candidate1 = data["slots"]["_CANDIDATE1_"]["values"][-1]
    if "first_candidate" not in candidate1:
        return jsonify(data)

    if candidate1["first_candidate"] == "PREV_CAND":
        # If we are looking for prev. candidate, check to see if there is one
        if len(data["slots"]["_CANDIDATE1_"]["values"]) > 1:
            # Remove the "PREV_CAND" entry, and get correct candidate
            data["slots"]["_CANDIDATE1_"]["values"].pop()
            candidate1 = data["slots"]["_CANDIDATE1_"]["values"][-1]
        else:
            return jsonify(data)

    candidate1 = candidate1["first_candidate"]

    cand1_found = False

    second_cand = data["slots"].get("_CANDIDATE2_")
    # If there is a second candidate, set the appropriate values
    if second_cand and "second_candidate" not in second_cand["values"][-1]:
        return data

    candidate2 = second_cand["values"][-1]["second_candidate"] if second_cand else ""
    cand2_found = False if second_cand else True

    # Get the state dictionary if it exists
    state_dict = data["slots"].get("_STATE_")
    # Set state to the actual state or national
    state = state_dict["values"][-1]["tokens"] if state_dict else "national"
    if state_dict:
        state_dict["values"][-1]["value"] = state.capitalize()
        state_dict["values"][-1]["resolved"] = 1

    with open("template/server/president_primary_polls.csv", "r") as f:
        reader = csv.reader(f)
        for i, line in enumerate(reader):
            if state == "national" or state == line[3].lower():
                if candidate1 == line[31]:
                    resp["slots"]["_CANDIDATE1_"]["values"][-1]["percent"] = line[32]
                    # Setting the token to candidates proper name
                    resp["slots"]["_CANDIDATE1_"]["values"][-1]["tokens"] = line[31]
                    resp["slots"]["_CANDIDATE1_"]["values"][-1]["resolved"] = 1
                    resp["slots"]["_CANDIDATE1_"]["values"][-1]["qid"] = line[0]
                    resp["slots"]["_CANDIDATE1_"]["values"][-1]["pollster"] = line[5]
                    resp["slots"]["_CANDIDATE1_"]["values"][-1]["url"] = line[26]
                    resp["slots"]["_CANDIDATE1_"]["values"][-1]["value"] = "___"
                    cand1_found = True
                elif candidate2 == line[32]:
                    resp["slots"]["_CANDIDATE2_"]["values"][-1]["percent"] = line[32]
                    # Setting the token to candidates proper name
                    resp["slots"]["_CANDIDATE2_"]["values"][-1]["tokens"] = line[31]
                    resp["slots"]["_CANDIDATE2_"]["values"][-1]["resolved"] = 1
                    resp["slots"]["_CANDIDATE2_"]["values"][-1]["qid"] = line[0]
                    resp["slots"]["_CANDIDATE2_"]["values"][0]["value"] = "___"
                    cand2_found = True

                if cand1_found and cand2_found:
                    return jsonify(resp)

    return jsonify(resp)

def get_polling_places(data):
    if "_LOCATION_" not in data["slots"]:
        return

    location = data["slots"]["_LOCATION_"]
    state = location["values"][-1]["tokens"]
    state = state.capitalize()

    connection = template.server.model.get_db()
    voting_info = connection.execute("""
    SELECT * FROM votingLocations WHERE state = ?
    """,
    (state,)).fetchone()

    if voting_info:
        location["values"][-1]["value"] = voting_info
        location["values"][-1]["resolved"] = 1

    return data
