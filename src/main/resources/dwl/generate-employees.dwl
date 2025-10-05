%dw 2.0
output application/json

var firstNames = [
    "John", "Jane", "Michael", "Sarah", "David", "Emily", "Robert", "Jessica", 
    "William", "Ashley", "James", "Amanda", "Christopher", "Stephanie", "Daniel", 
    "Melissa", "Matthew", "Nicole", "Anthony", "Elizabeth", "Mark", "Helen", 
    "Donald", "Deborah", "Steven", "Dorothy", "Paul", "Lisa", "Andrew", "Nancy",
    "Joshua", "Karen", "Kenneth", "Betty", "Kevin", "Sandra", "Brian", "Donna",
    "George", "Carol", "Edward", "Ruth", "Ronald", "Sharon", "Timothy", "Michelle",
    "Jason", "Laura", "Jeffrey", "Sarah", "Ryan", "Kimberly", "Jacob", "Deborah"
]

var lastNames = [
    "Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia", "Miller", "Davis",
    "Rodriguez", "Martinez", "Hernandez", "Lopez", "Gonzalez", "Wilson", "Anderson",
    "Thomas", "Taylor", "Moore", "Jackson", "Martin", "Lee", "Perez", "Thompson",
    "White", "Harris", "Sanchez", "Clark", "Ramirez", "Lewis", "Robinson", "Walker",
    "Young", "Allen", "King", "Wright", "Scott", "Torres", "Nguyen", "Hill", "Flores",
    "Green", "Adams", "Nelson", "Baker", "Hall", "Rivera", "Campbell", "Mitchell",
    "Carter", "Roberts", "Gomez", "Phillips", "Evans", "Turner", "Diaz", "Parker"
]

fun generatePhoneNumber(): String = do {
    var areaCode = (randomInt(900) + 100) as String
    var exchange = (randomInt(900) + 100) as String  
    var number = (randomInt(9000) + 1000) as String
    ---
    "(" ++ areaCode ++ ") " ++ exchange ++ "-" ++ number
}

fun generateEmployee(index: Number): Object = do {
    var firstName = firstNames[randomInt(sizeOf(firstNames))]
    var lastName = lastNames[randomInt(sizeOf(lastNames))]
    ---
    {
        name: firstName ++ " " ++ lastName,
        emailId: lower(firstName) ++ "." ++ lower(lastName) ++ "@gmail.com",
        phoneNumber: generatePhoneNumber()
    }
}

---
(1 to vars.employeeCount) map generateEmployee($)