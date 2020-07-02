#  Software Methods Final Project 
Jacob Justh & Kenneth An


At this stage of our implementation, much is incomplete. We have what we believe is the skeleton of our working application: a puzzle model that maintains the data of the loaded puzzle and its solutions/hints and a puzzle view controller that interacts with the user and manages the puzzle view. We have tested the ability to read in new puzzles in JSON format, which seems to work. 

Currently, the puzzle is displayed in a 5x5 view of UITextFields. When the user clicks one of these TextFields to enter in a value, the puzzle view controller (which also acts as the UITextFieldDelegate) checks the featured box, displays its hint, and allows the entry of one character into that box. As it stands right now, the view controller maintains member variables representing the current direction of hints provided, and the previous box clicked. Ideally, we can use these values to determine whether or not the across or down hint should be displayed based on a system where clicked a box twice toggles between the two. 

Our next steps are to initialize the puzzle view, either in PuzzleView.swift or through the puzzle view controller, with the unused boxes shaded in, used boxes as empty, and the initial hint displayed. From here, we will improve the functionality of checking user input against the model solution after boxes are filled, simplify the architecture to better follow MVC design, and improve the look and feel of the application.  

During these implementation stages, we will need to include thorough tests for functionality and edge cases. A central issue currently is how to best maintain the user input in conjunction with the puzzle model. Basically, the representation of the boxes is currently clunky, and could be improved, especially under the paradigm of DRY. 
