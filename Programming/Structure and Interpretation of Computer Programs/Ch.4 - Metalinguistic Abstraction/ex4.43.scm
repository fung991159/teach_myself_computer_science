Exercise 4.43: Use the amb evaluator to solve the following
puzzle:49
Mary Ann Moore’s father has a yacht and so has each of
his four friends: Colonel Downing, Mr. Hall, Sir Barnacle
Hood, and Dr. Parker. Each of the five also has one daugh-
ter and each has named his yacht aer a daughter of one of
the others. 

Sir Barnacle’s yacht is the Gabrielle, 
Mr. Moore owns the Lorna.
Mr. Hall the Rosalind. 
The Melissa, owned by Colonel Downing, is named after Sir Barnacle’s daugh-
ter. 
Gabrielle’s father owns the yacht that is named after Dr. Parker’s daughter. 

Who is Lorna’s father?
Try to write the program so that it runs efficiently (see Ex-
ercise 4.40). Also determine how many solutions there are
if we are not told that Mary Ann’s last name is Moore.

>> The trickiest part is actually the yacht name is the daughter name, which make things a whole lot more confusing`
    2 relationships:
    a. father-yacht
    b. father-daughter

condition: father's own daughter cannot be the same as yacht name


Barnacle: Gabrielle
Moore: Lorna
Hall: Rosalind
Downing: Melissa (Father=Barnacle)
Parker: Mary Ann (Father=Moore)


>> found this solution online, it is relatively more clear, 
This piece of information is hardeset to representation in the code
"Gabrielle’s father owns the yacht that is named after Dr. Parker’s daughter."

 (define (Yacht) 
   (define moore 1) 
   (define downing 2) 
   (define hall 3) 
   (define barnacle 4) 
   (define parker 5) 
  
   (define lorna 1) 
   (define mellissa 2) 
   (define rosalind 3) 
   (define gabrille 4) 
   (define mary 5) 
  
   (define (father-name father) 
     (define names (list 'moore 'downing 'hall 'barnacle 'parker)) 
     (list-ref names (- father 1))) 
    
   (define (owned-yacht father) 
     father) 
    
   (define (father-of daughter fathers) 
     (list-ref fathers (- daughter 1))) 
    
   (let ([F-mary (amb moore downing hall barnacle parker)]) 
     (require (= F-mary moore)) 
     (let ([F-mellissa (amb moore downing hall barnacle parker)]) 
       (require (= F-mellissa barnacle)) 
       (let ([F-lorna (amb moore downing hall barnacle parker)]) 
         (require (not (= F-lorna moore))) 
         (let ([F-rosalind (amb moore downing hall barnacle parker)]) 
           (require (not (= F-rosalind hall))) 
           (let ([F-gabrille (amb moore downing hall barnacle parker)]) 
             (require (not (= F-gabrille barnacle))) 
             (let ((fathers (list F-lorna F-mellissa F-rosalind F-gabrille F-mary))) 
               (require (= (father-of (owned-yacht F-gabrille) fathers) parker)) 
               (require (distinct? fathers)) 
               (list (list 'lorna (father-name F-lorna)) 
                     (list 'mellissa (father-name F-mellissa)) 
                     (list 'rosalind (father-name F-rosalind)) 
                     (list 'gabrille (father-name F-gabrille)) 
                     (list 'mary (father-name F-mary))))))))))