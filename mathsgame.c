/* Program that will stimulate a mathematics quiz */
/*

Development Environment: This program was developed in Visual Studio Code.

Author: Shahida Mohammed-Ahmed C21333116

Created: 13/11/2021    Modified: 28/11/2021
*/

#include <stdio.h>
#include <stdlib.h>

int main()

{
    char option;
    int guess;
    int correct_answer = 7;
    int wrong_answer = 0;
    int num_questions = 0; // if not assigned a starting number it will be given a random value
    int how_many_right_answers = 0;
    int how_many_wrong_answers = 0;

    int i = 0;
    int display_answer = 0;
    int has_played_quiz = 0;

    do
    {

        printf("1. How many questions would you like to answer\n");
        printf("2. Start quiz\n");
        printf("3. Numbers answered correctly/Incorrectly\n");
        printf("4. Exit program\n");
        printf("Choose an option : ");
        scanf("%1s", &option);

        switch (option)
        {
        case '1':
        {
            printf("\nHow many questions would you like to answer\n");

            char hold_enter_char_;
            scanf("%d", &num_questions);
            scanf("%c", &hold_enter_char_);

            if (num_questions > 5) // checks to see if the number they entered exeeds maximum number of 5
            {
                printf("\nenter a number between 1 and 5\n\n");
                int num_questions = 0;
            }
            else if (num_questions < 1)
            {
                printf("\nenter a number between 1 and 5\n\n");
                int num_questions = 0;
            }

            break;

        } // end case 1

        case '2':
        {
            while (i < num_questions)
            {
                printf("\n9-4/2 is equal to what?\n");

                char hold_enter_char_;
                printf("\nWhat is your guess?: ");
                scanf("%d", &guess);
                scanf("%c", &hold_enter_char_);
                

                if (guess == correct_answer)
                {
                    printf("Correct\nThe answer is 7!\n");

                    // increment the counter for the correct numbers
                    how_many_right_answers = how_many_right_answers + 1;

                } // end if
                else
                {
                    printf("Your Answer %d is Incorrect :( TRY AGAIN\n", guess);
                    // increment the counter for the wrong numbers
                    how_many_wrong_answers = how_many_wrong_answers + 1;

                } // end else

                i = i + 1;

                has_played_quiz = 1; // var is assigned 1 once the user has played the quiz making the code in 3 availible
            }
            if (num_questions == 0)
            {
                printf("\nenter valid number of questions and try again\n\n");
            }

            break;

        } // end case 2

        case '3':
        {
            if (has_played_quiz == 1)
            {
                printf("\n\nYou were correct %d times\n", how_many_right_answers);
                printf("\n\nYou were wrong %d times\n", how_many_wrong_answers);
            }
            else
            {
                printf("\nyou must play the quiz first\n\n"); // user is shown appropriate error message telling them they must play quiz before they can see number of correct or wrong answers
            }
            break;
        } // end case 3

        case '4':
        {
            printf("\nYou have exited the game");

            break;
        } // end case 4

        default:
        {
            printf("\nThe option you have entered is invalid\n");
            break;
        } // end default

        } // end switch

    } // end do

    while (option != '4');
    

    return 0;
} // end main
