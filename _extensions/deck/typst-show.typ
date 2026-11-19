#show: doc => deck(
$if(title)$
  title: [$title$],
$endif$
$if(subtitle)$
  subtitle: [$subtitle$],
$endif$
$if(by-author)$
  authors: ($for(by-author)$[$it.name.literal$],$endfor$),
$endif$
$if(date)$
  date: [$date$],
$endif$
$if(course)$
  course: [$course$],
$endif$
  doc,
)
