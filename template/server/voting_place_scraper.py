from bs4 import BeautifulSoup
import requests


headers = {"User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.3"}
webpage = requests.get('https://www.headcount.org/find-your-polling-place/', headers=headers)

soup = BeautifulSoup(webpage.text, "html.parser")

entries = soup.findAll("tr")

with open("voting_places.txt", "a") as file:
    for entry in entries[1:]:
        columns = entry.findAll("td")

        state = columns[0].find("a", attrs={"class": "hidden-xs"}).getText()

        link = columns[1].find("a", href=True)["href"]

        phone = columns[2].getText()[12:].strip()

        output = "('" + state + "', '" + link + "', '" + phone + "'),\n"

        file.write(output)
