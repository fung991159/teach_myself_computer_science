import string
import random

TARGET = "methinks it is like a weasel"
CHAR_BASE = [char for char in string.ascii_lowercase] + [" "]


# write a function that generates a string that is 28 characters long by choosing random letters from the 26 letters in the alphabet plus the space
def generate_random_str():
    return "".join(random.choice(CHAR_BASE) for _ in CHAR_BASE)


# function that will score each generated string by comparing the randomly generated string to the goal.
def score_generated_str(str_in: str):
    cnt = 0
    for target_letter, str_in_letter in zip(TARGET, str_in):
        if target_letter == str_in_letter:
            cnt += 1
    score = cnt / len(TARGET)

    return score


# third function will repeatedly call generate and score, then if 100% of the letters are correct we are done, print out the best string generated so far and its score every 1000 tries.
def loop_generate():

    loop_cnt = 1
    best_score = 0
    best_string = ""
    while True:
        random_str = generate_random_str()
        score = score_generated_str(str_in=random_str)

        # update best_score and best_string if it is better than existing
        if score > best_score:
            best_score = score
            best_string = random_str

        if score == 1:
            print("generated exact same text!")
            break

        if loop_cnt == 1000:
            loop_cnt = 1
            print(f"best_score so far is: {best_score:>6.1%}")
            print(f"best_string so far is: {best_string}")

        loop_cnt += 1


loop_generate()
