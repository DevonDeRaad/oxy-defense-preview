###create penalties figures
###Devon DeRaad
###26 September 2016
###read in worksheet
pens<- read.csv("~/Desktop/sciacpens.csv")
###subset only last year
pens2015<- subset(pens, year=="2015")
###set sciac color theme
c<- c("mediumpurple4", "red4", "goldenrod", "seagreen", "sienna2", "royalblue4", "firebrick", "darkslateblue")
###graph penalty yards per game for 2015
ggplot(data=pens2015, aes(x=reorder(school, -penydsperg), y=penydsperg, fill=school))+
  theme_minimal(base_size=13,)+
  ylab("Avg. penalty yards per game")+
  ylim(0,100)+
  xlab("School")+
  ggtitle("2015 Season")+
  geom_bar(stat="identity")+
  scale_fill_manual(values=c)+
  theme(axis.text.x=element_text(angle=45, face=c("bold", "plain", "plain", "plain", "plain", "plain", "plain", "plain"), hjust=1,vjust=1.2))+
  theme(legend.title=element_blank())
###year to year stripplot
ggplot(pens, aes(x=school, y=penydsperg, color=as.factor(pens$year)))+
  theme_minimal()+ 
  scale_color_manual(values=c("honeydew3", "lightblue3", "royalblue2", "midnightblue"))+ 
  geom_jitter(position=position_jitter(0.1), size=4)+
  theme(axis.text.x=element_text(angle=45, face=c("plain", "plain", "plain", "plain", "bold", "plain", "plain", "plain"), hjust=1,vjust=1.2))+
  ylab("Penalty yards per game")+
  ggtitle("Penalty yards per game 2012-2015")+
  theme(legend.title=element_blank())

