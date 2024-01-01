#!/bin/bash

for day in {1..24}
do
  # Define número aleatório de commits entre 5 e 10 por dia
  commits=$(( (RANDOM % 6) + 5 ))

  for ((i=1; i<=$commits; i++))
  do
    echo "Commit $i de janeiro" >> log.txt
    git add .

    # Gera hora e minuto aleatórios no intervalo de 00 a 23 e 00 a 59
    hora=$(printf "%02d" $((RANDOM % 24)))
    minuto=$(printf "%02d" $((RANDOM % 60)))

    # Data completa para o commit
    data="2024-01-$(printf "%02d" $day) $hora:$minuto:00"

    GIT_COMMITTER_DATE="$data" git commit --date="$data" -m "Commit $i do dia 2024-01-$(printf "%02d" $day) no jogo da memória"
  done
done

git push origin master
