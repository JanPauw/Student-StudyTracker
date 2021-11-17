UniManage App.

Thank you for viewing my project!

Attention!
To run this project, you will require the POE Task 1 Library, which can be downloaded here:
https://github.com/VCNMB-2021C/POE-Lib-Framework

Before Starting:
- Before compiling the project, make sure you have correctly referenced the Library in the program, mentioned above.
- After downloading this project you will need a program to compile it. I suggest using Visual Studio 2019.

Create SQL BEFORE STARTING:
===========================
Make Sure to Create a Database with the following table and Fields: (A copy of the SQL file can also be found on this repo)

	create table Student
	(
		[S_Number] varchar(255) NOT NULL PRIMARY KEY,
		[S_Name] varchar(255),
		[S_Surname] varchar(255),
		[S_SemLength] int,
		[S_SemStart] date,
    		[Password] varchar(MAX),
	);

	create table Module
	(
		[ID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
		[M_Code] varchar(255) NOT NULL,
		[M_Name] varchar(255),
		[M_Credits] int,
		[M_Hours] int,
		[S_Number] varchar(255),
		[M_Studied] int,

		FOREIGN KEY (S_Number) REFERENCES Student(S_Number),
	);

	create table StudyDay
	(
		[ID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
		[M_Code] varchar(255) NOT NULL,
		[S_Number] varchar(255),
		[M_Studied] int,
		[Study_Date] date
	);

MAKE SURE TO CHANGE THE NESSECARY CONNECTIONSTRING WITHIN THE Class Library, within the Connection class.
 

Running the Application:
After compiling, you will be met with a Login/Register screen.

===== Login/Register =====
On this page you will be able to Register an Account and Login with it.

Just fill out the form and press either the Register or the Login button.


===== Semester Info Page =====
- After logging in you will see the Semester Info Page, which will ask you to enter the length and the starting date of your semester.
- The Student Info Page only contains information about the student's semester.

===== Semester and Modules =====
- After confirming your Semester Details, you will be brought to this page where you will be able to see you semester details.
- After adding modules, you will be able to see a list of them, including some relevent information for each module.

===== Add Module Page =====
On this page you will be able to Add Modules to your module list.

You will see all relevant fields for Adding Modules to the list.

	> Adding Modules: Instructions to Add Modules to your list
		1. Fill out all required fields on the right side of the page. This will include the Module Code, Module Name,
		Number of Credits the module grants, and the amount of hours you have the module per week.
		2. After filling out all the fields mentioned above, click on the button, with the text "Add Module".
		By doing this you will see the module being added to the list on the Semester and Modules Page

===== Module Info Page =====
On the Semester and Modules Page, each Module in the table will have a corresponding "Module Info" link. Click on this.
On the new page you will be able to Edit/Delete a Module from your list.

	> Editing Modules: Instructions to Edit Modules from your list
		1. This requires for modules to be already added to the list.
		2. The fields will be autofilled with the chosen module's details.
		3. You can change these fields as you want.
		4. Click the button below which now says "Save Module".
		5. By clicking the button, you will see the module details change on the Semester and Modules Page

		NOTE: Changing the Module Code to a New/Existing Code can cause overwriting problems if you are not careful.

	> Deleting Modules: Instructions to Delete Modules from your list
		1. This requires for modules to be already added to the list.
		2. The fields will be autofilled with the chosen module's details.
		3. Click the button below which now says "Delete".
		4. you will be met with a prompt, whether you would like to delete the selected module.
		5. After confirming, the selected module will be deleted.

		NOTE: Deleting a module, will remove it from your user permanently.

===== Record Study Hours Page =====
	> Recording Self Study Hours: Instructions add self study time to your modules
		1. Click the "Record Hours" button.
		2. From the dorpdown, select the module you would like to add study hours to.
		3. Enter the amount of hours you studied, and what date you studied.
		4. Click "Save".