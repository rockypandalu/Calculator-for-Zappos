# Google Endpoint Implementation for Usage Counting and Workflow ID Assign

## Modules
1. Workflow ID Generator: Generate a workflow ID when receiveing a request.
2. Count Computing Hours: For demo applications running backgroun process and threads, at the start and end of each process, the application will send a request to Endpoint include the workflow ID, and the Endpoint will record the timestamp when receiving the request. The Endpoint can also cound the computing hour by calculating the time gap between timestamps with same correlation ID. There are two models considered: 
 1.the first one takes each process as an instance, and calculate the total computing hours for all process
 2.the second one takes all process as one instance. It only consider the time between the first process start and the last process end. 

## Deploy

1. Build a project in Google Cloud Platform and enable Billing

2. Open this folder through Pycharm

3. Change the application name to be the same as the project name

4. Click Tools -> Google App Engine -> Upload Google App Engine application

5. After authentication through website, the app is deployed on the Google App Engine

# Calculator in iOS
This is a calculator running on iOS and coded by Swift. The calculator works properly for operations including "**+**", "**-**", "**X**", "**/**", "**%**", "**^2**". The program has been tested on iPhone 6 and iPhone 6 Plus.
