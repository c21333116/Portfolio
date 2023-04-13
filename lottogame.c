/* 
Program description: Develop a program that will play the Lotto game. The program should allow a user to
enter their 6 selected numbers and give them a set of options, each performing a
specific requirement. You must store the 6 numbers in a 1-Dimensional array.
There are a number of requirements that your program must meet. Your program
must be modularised (i.e., use functions) and each task should be dealt in a separate
function. The program should display a simple menu to the user and each option in
the menu will be implemented by calling a separate function. You must use pointer
notation to access array elements – DO NOT use subscript notation.
The requirements are as follows (each implemented in a separate function):
1. Enter any 6 numbers (1–42 inclusive) from the keyboard. Perform any
necessary validation (error-checking) required (e.g., all numbers must be
different, range 1–42, etc.).
2. Display the contents of the 1-D array containing your lotto numbers that you
entered.
3. Sort the contents of the array in increasing order (i.e., 1st element = smallest
number, 2nd element = 2nd smallest number, etc.). You may use any sorting
algorithm of your choice.
4. Compare your chosen lotto numbers in the 1-D array with the following
winning numbers:
1,3,5,7,9,11 (Winning numbers)
Depending on how many of your chosen numbers match the above winning numbers,
your program should display one of the following messages:
Match 6 Jackpot
Match 5 New car
Match 4 Weekend away
Match 3 Cinema pass
5. Display the frequency of the numbers entered each time the user enters a new
set of numbers (without exiting the program) on the screen. For example, it
might display:
number 1 has been selected x times
number 7 has been selected x times
number 28 has been selected x times
etc.,
6. Exit program

Author: Shahida Mohammed-Ahmed
Date: 20/03/2022 */


#include <stdio.h>
#include <string.h>

#define CHOSEN 6 //function1, function2 and function3

#define WINNING_NUMBERS 6 // function 4

#define SIZE 42 // size of lotto numbers


void function1(int*,int*); //  function 1

void function2(int*); // function 2

void function3(int*); //function 3

void function4(int*, int*);  // function 4

void function5(int*); //function 5

int function6();


int main()
{
    char options;
    int chosen[CHOSEN]; // array for user input
    int frequency[SIZE+1]={0};

    int winning_numbers[WINNING_NUMBERS] = {1, 3, 5, 7, 9, 11};

    int option_b_first=0; //to check if the user picked option b on their first go

    int option_c_first=0; //to check if the user picked option c on their first go

    int option_d_first=0; //to check if the user picked option d on their first go

    int option_e_first=0; //to check if the user picked option e on their first go

    int result;


    do
     {

        //This is the Menu

        printf("\n");

        

        printf("Menu\n");

        printf("a.)Enter six different numbers 1-42 inclusive to play the Lotto\n");

        printf("b.)This option displays the six numbers you have selected\n");

        printf("c.)This option sorts the numbers you have entered\n");

        printf("d.)This option compares your six entered numbers with the winning numbers\n");

        printf("e.)This option shows how many times you have entered the same number\n");

        printf("f.)End game\n");



        printf("Please pick one of the options above \n");

       
        printf("\n");

        scanf("%1s", &options);

        if(options == 'a')

        {

            //values is the array of numbers that the user has inputted

            function1(chosen,frequency);

            /* Ensures the user does not pick option b,c,d or e on their first go and increments the variable of option b,c,d and e after option a has been run and in doing so, allows the other options to be executed  */

            option_b_first++;

            option_c_first++;

            option_d_first++;

            option_e_first++;



        }//end if


         else if(options == 'b')

        {

            if(option_b_first >0)

            {

                function2(chosen);//winning numbers is the array of numbers that the user entered

            }//end if

            else //if user does enter option b in their first try

            {

                printf("You cant pick option b on your first go");

                printf("Please pick option a to enter 6 numbers of your choice *first*");

            }//end else

        }//end else if



        else if(options == 'c')

        {

            if(option_c_first >0)

            {

                function3(chosen);

            }//end if

            else //if user does enter option c in their first try

            {

                puts("Yiu cant pick option c on your first try");

                puts("Please pick option a to input your 6 selected numbers");

            }//end else

        }//end else if



        else if(options == 'd')

        {

            if(option_d_first >0)

            {

                function4(winning_numbers, chosen);

            }//end if

            else //if user does enter option d in their first try

            {

                puts("ERROR! you cannot pick option d in your first try");

                puts("Please pick option a to input your 6 selected numbers");

            }//end else

        }//end else if

       

        //function 5 is implemented here

        else if(options == 'e')

        {

            if(option_e_first >0)

            {

                function5( frequency); 
                
                //Makes sure that the user does not pick option e first but it increments this variable after option d has finished and so allows option b to be executed

            }//end if

            else

            {

                puts("ERROR! you cannot pick option e in your first try");

                puts("Please pick option a to input your 6 selected numbers");

            }//end else

        }//end else if          

        

        //if the user inputs inappropriate options and numbers to play the lotto

        else if(options!='a'&&options!='b'&&options!='c'&&options!='d'&&options!= 'e'&&options!='f')

        {

            puts("Invalid input");

        }//end else if


       else if ( options == 'f')
       {
          
            result = function6();
       }

    }
    while (result != 1);
    
    puts("Thank you for playing this Lotto game");

   

    return 0;
        
} 









void function1(int *numbers,int *frequency)

{

    int i;
    int h;

    int temporary; // temporary variable that will hold every number entered by the user



    printf("a.) Enter six different numbers to play the Lotto\n");

    


    for(i=0; i<CHOSEN; i++)

    {

        scanf("%d", & *(numbers + i));

        //this if statement checks if the user entered numbers within the range of 1 - 42

        if (*(numbers + i) >= 1 && *(numbers + i) <= 42)

        {

            //this checks if the user entered the same number inside the array 

            for(h=0; h < i; h++)

            {

                if(*(numbers +i) == *(numbers +h))

                {

                    printf("You cannot enter the same number");

                    printf("The game will restart");

                    return; //it returns back to the menu if the user entered the same number

                }//end inner if statement

            }//end for loop for checking

        }//end if

        //the else statement confirms that the user input numbers outside the range of 1 - 42 

        else

        {

            printf("You must enter numbers between 1-42\n");

            printf("The game will restart \n");

            printf("\n"); 

            break; /*allows the function to be executed again until user inputs correct numbers */

        }//end else statement

        temporary = *(numbers +i);/*places every number entered by the user into the respective array element*/

        

        if(*(numbers+i) == *(numbers+h))
        {
            frequency++;
        }







    }//end for loop

}//end function part1


// function 2

//This function shows the lotto numbers entered by the user 

void function2(int *show)

{

    int i;

    printf("b.) Display the six numbers you have selected");

    for(i=0; i<CHOSEN; i++)

    {
       printf("The numbers you entered are: %d \n", *(show + i));

    }//end for

}//end function 2



void function3(int *sort)

{

    int min; //looks for the smallest number in the array and places it in the first element

    int temp; //temporary variable that sorts numbers

    int i;
    int h;

   

    //start selection sort

    //  selection sort looks through the array to find the smallest number and sorts it in ascending order

    for(i=0; i<CHOSEN-1; i++)

    {

        min=i;

        for(h=i+1; h<CHOSEN; h++)

        {

            if(sort[h] < sort[min])

            {

                min = h;

            }

        }//end inner for loop

        temp = sort[min];

        sort[min] = sort[min];

        sort[min] = sort[i];

        sort[i] = temp;

    }//end outer for loop

   

    printf("The sorted numbers are: \n");

    for(i=0; i<CHOSEN; i++)

    {

        printf("%d, ", *(sort + i)); //displays the numbers in ascending order

    }//end for loop

}//end function 3


void function4(int *compare,int *chosen)

// Winning_numbers are the winning numbers and CHOSEN is the user input

{

    int counter = 0; //a counter to see how many matched numbers did the user got
    int i;
    int h;

   
    
    printf("\n");


    
   // this for loop is a counter
   for(i=0; i<WINNING_NUMBERS; i++)

    {

        for(h=0; h<WINNING_NUMBERS; h++)

        {

            //checks if the number users entered matches the winning numbers

            if(*(compare +h) == *(chosen + i))

            {

                counter++;

                printf("The matching numbers are:winning number %d and your number %d \n",*(compare + h),*(chosen + i));

            }//end if

        }//end for loop


    }//end for loop


    //These determines if the user wins anything

    if(counter == 6)

    {

        puts("Jackpot!");

    }//end if


    else if(counter ==5)

    {

        puts("You won a New Car!");

    }//end else if


    else if(counter ==4)

    {

        printf("You won a Weekend away");

    }//end else if

    else if(counter==3)

    {

        puts("You won a Cinema pass");

    }//end else if

    else if(counter==2 || counter ==1 )

    {

        puts("You didn't win anything");

    }//end else if

   

    else if(counter!=6 && counter!=5 && counter!=4 && counter!=3 )

    {

        printf("Your numbers didnt match the winning numbers sorry");

    }// end else if statement

}//end function 4

void function5(int *frequency)

{

    int i;

   

    puts("e.)Check the amount of times you entered the same number");

    for(i=0; i<CHOSEN+1; i++)

    {

        //if statement that displays the amount of times a certain number was entered by the user

        if(*(frequency + i) != 0)

        {

            printf("Number %d has been selected %d times \n",i,*(frequency +i));

        }//end if statement

    }//end for loop

}//end function part 5

int function6()
{

  char str1[3];
  char str2[4] = {"yes"};
  int result;
  printf("You sure you want to end/exit program(yes/no)?\n");
  scanf("%s", str1);

  result = strcmp(str1, str2);
   //Check if the strings are the same using string compare

   if(result == 0)
   {
      printf("Program Ending!!!\nThanks for playing");
      return 1; // returns 1 if strings are differents
   } // end if
   else
   {
     printf("Returning back to program!!!\n");
     return 0;
   } // end else
}















































