library(plyr)
library(dplyr)
ppath<-function(g,p1,p2,p3,p4,p5,col){
df<-
  tibble::tibble(pn=1:5,da=c(p1,p2,p3,p4,p5))

writepaths<-function(x=df,gg=g,color=col){
  writeLines(paste0('g[class$="',g,'-paths"] > *.ppath-p',x$pn[1],'{'))  
  writeLines(paste0('stroke-dasharray:',x$da[1],';'))
  writeLines(paste0('-webkit-animation-name:',gg,'-p',x$pn[1],'draw;'))
  writeLines(paste0('animation-name:',gg,'-p',x$pn[1],'draw;'))
writeLines(paste0("}"))  

  
writeout<-paste0(
  'keyframes ',gg,'-p',x$pn[1],'draw {','\n',
  '0%{','\n',
  'stroke-width:3;','\n',
  'stroke-dashoffset:',x$da[1],';','\n',
  '}','\n',
  '80%{','\n','stroke:',color,';','\n','stroke-dashoffset:0;','\n','}','\n',
  '100%{','\n',
  'stroke-width:.25;','\n',
  '}','\n',
  '}')

 writeLines(paste(c('@-webkit-','@-moz-','@-o-','@'),writeout,collapse="\n",sep=""))

}
cat(c(paste0("/*"),rep("-",times=20)))
writeLines(paste0(toupper(g)," STARTS HERE*/"))

d_ply(df,c("pn","da"),writepaths)

top<-list(paste0(
  '@namespace svg "http://www.w3.org/2000/svg";',
  
'',
'.w-fallback {',
'display: none;',
'visibility: hidden;',
'}',
'',  
  'svg|g.w-fallback {',
'    display: inline;',
'    visibility: visible;',
'  }',
  
'  /*Container Row for inline SVG*/',
'    .mainblock {',
'      display:block;',
'      padding:1em;',
'      width:25%;',
'      height: 250px;',
'      position: relative;',
'    }',
'',  
'  .svg-col > div[class*="box"] {',
'padding:1em;',
'    width:100%;',
'height: 100%;',
'    min-height:200px;',
'    position:absolute;',
'    top:0;',
'    left:0;',
'  }',
'',  
'  div[class*="box"] > svg {',
'    width:100%;',
'    height:100%;',
'}  '))

stro_list<- list(paste0('g[class$="',g,'-paths"] > path[class*="ppath"]{'),
                 "stroke:#fff;",
  "-webkit-animation-direction:linear;",
  "animation-direction:linear;",
  "-webkit-animation-duration:3s;",
  "animation-duration:3s;",
  "-webkit-animation-fill-mode: forwards;",
  "animation-fill-mode: forwards;",
  "-webkit-animation-iteration-count: 1;",
  "animation-iteration-count: 1;",
  "-webkit-animation-timing-function:ease-in-out;",
  "animation-timing-function:ease-in-out;",
"}")
l_ply(stro_list,function(x){cat(x, "\n")})

opac_list<- list(paste0('g[class$="',g,'-paths"]{'),
                 paste0('fill:',col,";"),
                 "fill-opacity:0;","}")

l_ply(opac_list,function(x){cat(x, "\n")})
writeLines(paste0("/*",toupper(g)," ENDS HERE*/"))

}










#bl
sink("~/Desktop/darrell-website-new/css/portrait.css")
ppath(g = "bl",750,1405,683,1183,1236,col="#000")
#85
ppath(g = "g85",1009,1220,1324,2512,1849,col="#4D4D4D")
#75
ppath(g = "g75",169,543,221,451,800,col="#999")
#65
ppath(g = "g65",75,193,154,121,133,col="#B3B3B3")
# 60
ppath(g="g60",2224,970,2505,2262,1903,col="#CCC")
ppath(g="g50",1196,878,437,479,709,col="#F2F2F2")


op_list<-list(
  'g[class*="paths"]{',
    'animation-name:fillopac;',
    '-webkit-animation-name:fillopac;',
    'animation-direction:linear;',
    '-webkit-animation-direction:linear;',
    'animation-duration:2.46s;',
    '-webkit-animation-duration:2.46s;',
    'animation-fill-mode: forwards;',
    '-webkit-animation-fill-mode: forwards;',
    'animation-iteration-count: 1;',
    '-webkit-animation-iteration-count: 1;',
    'animation-delay:2.46s;',
    '-webkit-animation-delay:2.46s;',
    'animation-timing-function:ease-in-out;',
    '-webkit-animation-timing-function:ease-in-out;',
  '}',
  ' ',
  '@keyframes fillopac {',
    '0%{fill-opacity:0;}',
    '100%{fill-opacity:.75;}',
  '}')
l_ply(op_list,function(x){cat(x,"\n")})  
  

sink()
  