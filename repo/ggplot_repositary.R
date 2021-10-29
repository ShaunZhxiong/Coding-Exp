

###1 facet % using defined fucntion to stylize
ggplot()+
  geom_sf(data = st_union(tracts09))+
  geom_sf(data=myData,aes(fill = q5(TotalPop))) +
  scale_fill_manual(values = palette5,
                    labels = qBr(myData, "TotalPop"),
                    name = "Popluation\n(Quintile Breaks)") +
  labs(title = "Total Population", subtitle = "Philadelphia; 2009") +
  facet_wrap(~Selection_Type)+
  mapTheme() + 
  theme(plot.title = element_text(size=22))