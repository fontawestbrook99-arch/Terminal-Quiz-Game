#!/bin/bash
score=0
Ans_correct=0
Ans_incorrect=0
correct_stk=0
max_streak=0
question_file=question.txt
question_num=0
if [[ ! -f "$question_file" ]];then
   echo "erro: $question_file not found"
fi
if [[ ! -s "$question_file" ]];then
   echo "erro: $question_file not found"
fi
echo "********PRACTICE MODE******"
echo "-----------./QUIZ.SH----------"
   echo "-----------QUIZ GAME----------"
   read -p "enter username: " name
   echo "NAME: $name" >> highscore.txt
   date=$(date +%d-%m-%Y)
   echo " date: $date"
   echo " DATE: $date" >> highscore.txt
   mapfile -t question < <( shuf "$question_file")
   total_questions=${#question[@]}
echo "------------------------------------------------"
for question_data in "${question[@]}"; do
   IFS='|' read -r question opt_a opt_b opt_c opt_d correct <<< "$question_data"
   while true; do
         echo -e "\nQuestion: $question"
         echo "$opt_a"
         echo "$opt_b"
         echo "$opt_c"
         echo "$opt_d"
         echo -n "enter your answer (A/B/C/D) : "
         read -r user_answer
      if [[ "${user_answer^^}" == "${correct^^}" ]]; then
         echo "Correct($correct)"
         ((score++))
         ((Ans_correct++))
         ((corect_stk++))
         break
      elif [[ ! "${user_answer^^}" =~ ^[A-D]$ ]]; then
        echo -e "\ninvalide try again"
      elif [[ "${user_answer^^}" != "${correct^^}" ]]; then
       echo "Incorrect  the correct answer was $correct"
         ((Ans_incorrect++))
         break
      else
          break
      fi
   done

   echo "------------------------------------------------"
   read -p "press enter to continue"
done
clear
total_quest=$((Ans_correct+Ans_incorrect))
echo "total question ask: $total_quest"
echo "number of correct answer: $Ans_correct"
echo "number of incorrect answer: $Ans_incorrect"
echo "longest correct streak: $Ans_correct"
echo "current_streak: $Ans_correct"
score=$((Ans_correct*100/total_quest))
echo "Score: $score%"
echo "$Ans_correct/$total_quest" >> highscore.txt
echo "SCORE: $score%" >> highscore.txt
echo "------------------------------------------------"
echo ""
echo "********PRACTICE MODE******"
echo "-----------./QUIZ.SH----------"
      mapfile -t question < <( shuf "$question_file")
    total_questions=${#question[@]}
echo "------------------------------------------------"
for question_data in "${question[@]}"; do
    IFS='|' read -r question opt_a opt_b opt_c opt_d correct <<< "$question_data"
    echo -e "\nQuestion: $question"
    echo "$opt_a"
    echo "$opt_b"
    echo "$opt_c"
    echo "$opt_d"
    echo -n "enter your answer (A/B/C/D) : "
    read -r user_answer
     if [[ "${user_answer^^}" == "${correct^^}" ]]; then
        echo "Correct! ($user_answer)"     
     else
        echo "Incorrect  the correct answer was $correct"
     fi
    echo "------------------------------------------------"
done
