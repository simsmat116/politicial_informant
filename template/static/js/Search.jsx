import React, { Component } from 'react';
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import InputGroup from 'react-bootstrap/InputGroup';
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Image from 'react-bootstrap/Image'


const AI_VERSION = '92f45f92-9b7f-48dc-a567-dc95d1d9634b';
// Application token generated using OAuth Authorization
const APP_KEY = '37fb2d10222a577c3b77f557b4653701852896f3';

class Search extends Component {
  constructor(props) {
    super(props);
    this.state = {query: '', 
                  conversation: [{
                    text: "Welcome to Political Informant, I'm here to answer all your political related questions! To get started, ask me about registering to vote, candidates stances, or poll standings!",
                    type: "response",
                  }], 
                  dialogToken: '', 
                  index: 0 
    }
    this.handleChange = this.handleChange.bind(this);
    this.handleQuery = this.handleQuery.bind(this);
  }

  // Change the query state when the user types something new
  handleChange(e) {
    this.setState({
      query: e.target.value
    });
  }

  // Send the query to the Clinc Platform when user clicks Submit
  handleQuery(e) {
    if(!this.state.query){
      return
    }
    // Storing query object in conversation array
    this.setState({
      conversation: this.state.conversation.concat({
        text: this.state.query,
        type: "query",
      })
    }, () => {
      document.getElementById('bottomOfMessages').scrollIntoView();
    });


    // Send POST request to the Clinc query API
    fetch('https://api.clinc.ai/v1/query', {
      method: 'POST',
      headers: {
        'Authorization': 'app-key ' + APP_KEY,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        query: this.state.query,
        lat: 0,
        lon: 0,
        device: "Alexa",
        time_offset: 300,
        dialog: this.state.dialogToken,
        ai_version: AI_VERSION
      })
    })
      .then((response) => {
        if(!response.ok) throw Error(response.statusText);
        return response.json();
      })
      .then((context) => {
        // Store the response object in the conversation
        console.log(context.visuals.formattedResponse);
        this.setState({
            conversation: this.state.conversation.concat({
            text: context.visuals.formattedResponse,
            type: "response"
          }),
          dialogToken: ""
        });

        console.log(JSON.stringify(context.response.type));
        if(context.response.type != "query_polling_info"){
          console.log("HMMM")
          this.setState({
            dialogToken: context.dialog
          });
        }

        document.getElementById('bottomOfMessages').scrollIntoView();
      })
      .catch(error => {
        console.log(error);
        this.setState({
          conversation: this.state.conversation.concat({
            text: "I'm sorry, I'm not sure I understand. Could you clarify your last message?",
            type: "response"
          })
        });
        document.getElementById('bottomOfMessages').scrollIntoView();
      });

      // Reset the query to empty upon successful response
      this.setState({
        query: ''
      })

      e.preventDefault();
  }

  render() {

    return (
      <div>
        <Container className="p0" >
          <Row className="all-chats">
            <Col className="align-items-center">
              <Row className="align-items-center mt4 pt4">
                <a className="sidebar-title">Candidate Sites</a>
              </Row>
              <Row className="align-items-center mt1">
                <a href="https://berniesanders.com/" target="_blank" className="sidebar-item">Bernie Sanders</a>
              </Row>
              <Row className="align-items-center mt1">
                <a href="https://joebiden.com/" target="_blank" className="sidebar-item">Joe Biden</a>
              </Row>
              <Row className="align-items-center mt1">
                <a href="https://www.donaldjtrump.com/" target="_blank" className="sidebar-item">Donald Trump</a>
              </Row>
            </Col>
            <Col xs={8}>
              <Container className ="grow-from-bottom mb2 mt2 pl1 pr1">
                <Container className="chat-box pt1">
                    {this.state.conversation.map((response, index) => {
                    if (response.type === "query") {
                      return (
                      <Row>
                        <Container className="text-message-row mr2 mb2">
                          <Row className="align-items-center">
                            <Col className="p0">
                              <div className="conversation-query"><div className="chat-text pr1 mr1 ml1 mb1">{response.text}</div></div>
                            </Col>
                            <Col xs={2} className="p1">
                              <Image src="../static/images/user.png" roundedCircle className="user-png mr2"/>
                            </Col>
                          </Row>
                        </Container>
                      </Row>
                    ) }
                    else {
                      var http = response.text.match(/\bhttp?:\/\/\S+/gi);
                      var https = response.text.match(/\bhttps?:\/\/\S+/gi);
                      var first_string = <span>{response.text}</span>;
                      var second_string = <span>{""}</span>;
                      var our_link = <span></span>
                      if (http != null && http.length === 1) {
                        var n =  response.text.search(http[0]);
                        first_string = <span>{response.text.slice(0, n)}</span>;
                        var m = n + http[0].length;
                        second_string = <span>{response.text.slice(m, response.text.length)}</span>;
                        our_link = (<a href={http[0].slice(0,  http[0].length - 1)} target="_blank" className="message-link">here</a>)
                      }
                      else if (https  != null && https.length === 1) {
                        var n =  response.text.search(https[0]);
                        first_string = <span>{response.text.slice(0, n)}</span>;
                        var m = n + https[0].length;
                        second_string = <span>{response.text.slice(m, response.text.length)}</span>;
                        our_link = (<a href={https[0].slice(0,  https[0].length - 1)} target="_blank" className="message-link">here</a>)
                      }
                    return (
                      <Row>
                        <Container className="text-message-row ml1 mr1 mb2">
                          <Row className="align-items-center">
                            <Col xs={1} className="p1">
                              <Image src="../static/images/lil_informant.png" roundedCircle className="lil-informant align-middle"/>
                            </Col>
                            <Col key={index} xs={11} className="p1">
                              <div  className="conversation-response"><div className="chat-text mr1 pl1 mb1">{first_string} {our_link} {second_string}</div></div>
                            </Col>
                          </Row>
                        </Container>
                      </Row>
                    )
                    }})}
                    <div id="bottomOfMessages"></div>
                </Container>
              </Container>
              <Container className="p0">
                <Form className="message-container">
                    <Form.Control
                      type="text"
                      value={this.state.query}
                      onChange={this.handleChange}
                      placeholder="Enter A Query"
                      className="query-input"
                    />
                    <Button
                      variant="light"
                      type="submit"
                      className="query-input"
                      onClick={this.handleQuery} >
                      <Image src="../static/images/send.png" className="send-png" fluid/>
                    </Button>
                </Form>
              </Container>
            </Col>
            <Col className="align-items-center">
              <Row className="align-items-center mt4 pt4">
                <a className="sidebar-title">Other Sources</a>
              </Row>
              <Row className="align-items-center mt1">
              <a href="https://data.fivethirtyeight.com/" target="_blank" className="sidebar-item">fivethirtyeight</a>
              </Row>
              <Row className="align-items-center mt1">
              <a href="https://www.headcount.org/" target="_blank" className="sidebar-item">Headcount</a>
              </Row>
            </Col>
          </Row>
        </Container>
        <Image src="../static/images/PI_logo.png" className="image-size width-50" fluid/>
        <Container className="mt1 pt1 width-50">
          <Row>
            <Col>
              <a href="https://github.com/amarur/political_informant" target="_blank">
                <Image src="../static/images/Github_logo.png" className="icon-size mr1 mb1"  />
                <span className="pt2">
                  Github
                </span>
              </a>
            </Col>
            <Col>
              <a href="https://github.com/amarur/political_informant/issues/new" target="_blank">
                <Image src="../static/images/issue_icon.png" className="icon-size mr1 issue-span"  />
                <span >
                  Report an Issue
                </span>
              </a>
            </Col>
          </Row>
        </Container>
      </div>
    );
  }
}

export default Search;
