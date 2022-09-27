# Sweater Weather

<ul>
<li><b>Sweater Weather</b> is a <b>Rails</b> application that works within a service-oriented architecture to expose data through an <b>API</b> that the front-end team can consume.</li>
<li>Additional Functionality:</li><ul>
<li>Uses serializers to format <b>JSON</b> responses</li>
<li>Tests <b>API</b> exposure</li>
<li>Generates <b>user token</b> for API access and authentication</li></ul>
</ul>

<!-- TABLE OF CONTENTS -->
<h2 id="table-of-contents"> :book: Table of Contents</h2>

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#techical-requirements"> ➤ Technical Requirements</a></li>
    <li><a href="#project-files-description"> ➤ Project Files Description</a></li>
    <li><a href="#db-schema"> ➤ Database Schema</a></li>
    <li><a href="#getting-started"> ➤ Getting Started</a></li>
    <li><a href="#scenario1"> ➤ Scenario 1: Run RSpec Test Suite </a></li>
    <li><a href="#scenario2"> ➤ Scenario 2: Find the Forecast at a Location</a></li>
    <li><a href="#scenario3"> ➤ Scenario 3: Register a User </a></li>
    <li><a href="#scenario4"> ➤ Scenario 4: Initiate a User Session </a></li>
    <li><a href="#scenario5"> ➤ Scenario 5: Get Directions and Weather at Arrival </a></li>
    <li><a href="#credits"> ➤ Credits</a></li>
  </ol>
</details>

<!-- TECHNICAL REQUIREMENTS -->
<h2 id="techical-requirements"> 💻 Technical Requirements</h2>
<ul>
  <li>Ruby 2.7.4</li>
  <li>Rails 5.2.6</li>
  <li>RSpec-Rails 4.0.1</li>
  <li>SimpleCov</li>
  <li>Webmock</li>
  <li>VCR</li>
  <li>Postman</li>
  </ul>
  <p><i>Installation instructions found in</i> <a href="#getting-started"> ➤ Getting Started</a></p>
   
<!-- PROJECT FILES DESCRIPTION -->
<h2 id="project-files-description"> :floppy_disk: Project Files Description</h2>

<ul>
  <li><b>app/controllers/api/v1</li></b>
  <ol>
  <li>Contains several controllers responsible for rendering <b>JSON</b> responses and status codes.</li></ol>
  <li><b>app/serializers</b></li><ol>
  <li>Serializers for formatting forecast and road trip data, as well as user authentication and session creation.</li>
 </ol>
   <li><b>app/models/user.rb</b>
    <ol><li>Generates user access token</li>
    <li>Verifies secure passowrd</li></ol>
  <li><b>app/facades</b></li><ol>
  <li>Contains facades called by controller actions</li>
  <li>Links to service calls to Mapquest API and OpenWeather API</li></ol>
  <li><b>app/spec/requests/api/V1</b><ol>
  <li>Testing suite for API calls to endpoints</li></ol>
</ol>
</ul>

<h3>Some other supporting files</h3>
<ul><li><b>app/coverage</b><ol>
  <li>Shows SimpleCov coverage report</li>
</ul>

<!-- DATABASE SCHEMA -->
<h2 id="db-schema"> :desktop_computer: Database Schema</h2>

![image](https://user-images.githubusercontent.com/95776577/192566653-aede3375-02a3-4ce5-97bb-90c617bd3706.png)

  <p>Note: Only <i>Users</i> were stored in database based on frontend requirements</p>
  
<!-- GETTING STARTED -->
<h2 id="getting-started"> :book: Getting Started</h2>

<p><b>1. </b> Create a new directory on your computer where you'd like the program to live.</p>
<pre><code>$ mkdir /your_folder/sweater_weather</code></pre>

<p><b>2. </b> Navigate into the recently created directory.</p>
<pre><code>$ cd /your_folder/sweater_weather</code></pre>
<p><b>3. </b> Copy the repository by clicking on the code button on Github repo page (using SSH).</p>

![183747041-40f47875-442e-4008-8d00-8c45bf2731fe](https://user-images.githubusercontent.com/95776577/183752233-c9130b38-ce16-4b4c-aeb4-fdf0d0d4a137.png)

<p><b>4. </b> Clone the recently copied repository information into your currenty directory.</p>
<pre><code>$ git clone git@github.com:JohnSantosuosso/sweater_weather.git</code></pre>

<p><b>5. </b> Open the repository in your preferred IDE.  If you are using VSCode, use the code command shown below:</p>
<pre><code>$ code .</code></pre>

<p><b>6. </b>Signup for Mapquest API</a>.</p>
<ul><li>Visit <a href="https://developer.mapquest.com/documentation/">Mapquest API 2</a></li>
<li>Obtain an API key</li></ul>

<p><b>7. </b>Signup for OpenWeather API</a>.</p>
<ul><li>Visit <a href="https://openweathermap.org/api">OpenWeather API </a></li>
<li>Obtain an API key</li></ul>

<p><b>8. </b>Install Figaro to create application.yml and store your keys here</a>.</p>
<pre><code>$ bundle exec figaro install</code></pre>
<ul><li>Add keys to application.yml</li>

<img width="711" alt="Screen Shot 2022-09-27 at 11 27 02 AM" src="https://user-images.githubusercontent.com/95776577/192569304-78264303-36be-41d3-8dd6-1c5919771d13.png"></ul>

<p><b>8. </b> In your IDE, install dependencies found in Gemfile using your terminal</a>.</p>
<pre><code>$ bundle install</code></pre>

<p><b>9. </b> Run migrations and dump schema</p>
<pre><code>$ rake db:{create,migrate}</code></pre>

<!-- SCENARIO1 -->
<h2 id="scenario1"> :small_orange_diamond: Scenario 1: Run RSpec Test Suite</h2>
<p>View the tests for API endpoints inside <b>spec/requests</b>.</p>
<p>Test all functionality by running:</b>.</p>
<pre><code>$ bundle exec rspec spec</code></pre>

<!-- SCENARIO2 -->
<h2 id="scenario2"> :small_orange_diamond: Scenario 2: Find the Forecast at a Location </h2>
  <li><b>Start the application on your local server</b></li><ul>
  <li><pre><code>$ rails s</code></pre></li></ul>
  <li><b>Open Postman</b></li><ul>
  <li>Create the following request(enter location of your choice) and click the <b>Send</b> button in the top right corner.</li>
  </ul>
  
  ![image](https://user-images.githubusercontent.com/95776577/192570763-9b6739ab-6474-4f8f-af6b-9873a48c55f1.png)
  
 <!-- SCENARIO3 -->
<h2 id="scenario3"> :small_orange_diamond: Scenario 3: Register a User </h2>
  <li><b>Start the application on your local server</b></li><ul>
  <li><pre><code>$ rails s</code></pre></li></ul>
  <li><b>Open Postman</b></li><ul>
  <li>Create the following request(enter the email and password of your choice) and click the <b>Send</b> button in the top right corner.</li>
  </ul>
  
![image](https://user-images.githubusercontent.com/95776577/192571334-15231908-79f2-4ef4-8c10-3a8e38fa8b34.png)

 <!-- SCENARIO4 -->
<h2 id="scenario4"> :small_orange_diamond: Scenario 4: Initiate a User Session </h2>
  <li><b>Start the application on your local server</b></li><ul>
  <li><pre><code>$ rails s</code></pre></li></ul>
  <li><b>Open Postman</b></li><ul>
  <li>Create the following request(make sure to enter the email and password of an existing user) and click the <b>Send</b> button in the top right corner.</li>
  </ul>
  
![image](https://user-images.githubusercontent.com/95776577/192571821-2df97ab5-fb76-4fc2-ae63-d8c63bcff915.png)

 <!-- SCENARIO5 -->
<h2 id="scenario5"> :small_orange_diamond: Scenario 5: Get Directions and Weather at Arrival </h2>
  <li><b>Start the application on your local server</b></li><ul>
  <li><pre><code>$ rails s</code></pre></li></ul>
  <li><b>Open Postman</b></li><ul>
  <li>Create the following request(make sure to enter a valid starting and ending location) and click the <b>Send</b> button in the top right corner.</li>
  </ul>
  
![image](https://user-images.githubusercontent.com/95776577/192572131-3cce44b2-65f6-4a24-aeed-8fa8c0626172.png)


  
<!-- CREDITS -->
<h2 id="credits"> :scroll: Credits</h2>
<h3>John Santosuosso</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/johnsantosuosso)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/john-santosuosso)

<p>Project inspired and guided by Turing School of Software and Design's <a href="https://backend.turing.edu/module3/projects/sweater_weather/index"> Sweater Weather.</a></p>

