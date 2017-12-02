---https://www.facebook.com/login
Feature: Login Facebook
	In order to login Facebook successful
	Users should be input valid Email/Phone number and Password
	
Background:
	Given user:
	|Email         | phone number     |  Password
	|abc@gmail.com | 012345678        |  a1s2d3
	
Scenario: Login by Email successful
	Given Access https://www.facebook.com/login
	When I input Email = abc@gmail.com 
	When I input Password = a1s2d3
	When I press button "Login"
	Then Webpage should be load as user who has email abc@gmail
	
Scenario: Login by phone number successful
	Given Access https://www.facebook.com/login
	When I input Phone number = 012345678
	When I input Password = a1s2d3
	When I press button "Login"
	Then Webpage should be load as user who has Phone number = 012345678

Scenario: Login fail
	Given Access https://www.facebook.com/login
	When I input Email/Phone = <email/phone>
	When I input Password = <password>
	When I press button "Login"
	Then pop-up "Please input valid Email/Phone and Password"
	
	|email/phone     |password                                 |
	|null			 |null			                           |
	|abc@gmail.com   |null                                     |
	|abc@gmail.com   |1234                                     |
	|012345678       |null                                     |
	|012345678       |1234                                     |
	|abc@gmail.com   |123 or "1=1"                             |
	|012345678       |<div id="mantis" class="centered_page">  |
	|012345678       |Select * from Users                      |
	|abc123@gmail.com|a1s2d3                                   |
	|abc@gmail.com   |abc@gmail.com                            |
