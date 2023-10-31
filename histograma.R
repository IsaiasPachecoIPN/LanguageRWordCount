library(stringr)

push <- function(obj, input) {
  variable <- deparse(substitute(obj))
  out <- get(variable, envir = parent.frame(n=2))
  out[[length(out)+1]] <- input
  assign(variable, out, envir = parent.frame(n=2))
}

pop <- function(obj) {
  variable <- deparse(substitute(obj))
  obj <- get(variable, envir = parent.frame(n=2))
  
  if (length(obj) > 0) {
    out <- obj[[length(obj)]]
    assign(variable, obj[-length(obj)], envir = parent.frame(n=2))
  }else{
    out <- NULL
    assign(variable, out, envir = parent.frame(n=2))
  }
  
  return(out)
}

# Store currently used directory 
path <- getwd()

# Palabras reservadas de C++
keywords_cpp <- c("asm","double","new","switch","auto","else","operator","template","break","enum","private",	"this","case"	,"extern",	"protected","throw","catch","float","public","try","char","for","register","typedef","class","friend","return","union","const","goto","short","unsigned","continue","if","signed","virtual","default","inline","sizeof","void","delete","int","static","volatile","do","long","struct","while")

# Palabras reservadas de Python
keywords_python <- c("and", "as", "assert", "break", "class", "continue", "def", "del", "elif", "else", "except", "finally", "for", "from", "global", "if", "import", "in", "is", "lambda", "not", "or", "pass", "print", "raise", "return", "try", "while", "with", "yield")

code_cpp <- readLines(paste(path, "/Documentos/Probability/Histograma en R/salidac", sep = ""))

#Aux array to store cpp_words_counts
cpp_words_count <- list()

#Count and store CPP words count
for (i in keywords_cpp){
  push(cpp_words_count, sum(str_count(code_cpp, i)))
}

aux_data = as.numeric(cpp_words_count)
aux_intervalos = seq(0, length(cpp_words_count)-1, 1)

#Store the data and labels into dataframe
aux_data_etiquetas = data.frame(aux_data, keywords_cpp)

#Sort dataFrame
ordered_data_etiquetas = aux_data_etiquetas[order(aux_data_etiquetas$aux_data, decreasing = TRUE),]

#Display dataFrame
barplot(ordered_data_etiquetas$aux_data, names.arg = ordered_data_etiquetas$keywords_cpp, main="Histograma palabras reservadas CPP", las=2)

