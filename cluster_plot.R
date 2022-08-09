# set.seed(123)
# #利用k-mean是进行聚类
# df <- scale(otu)
# km_result <- kmeans(t(otu), 5, nstart = 41)
# print(km_result)
# dd <- as.data.frame(cbind(t(df), cluster = km_result$cluster))
# table(dd$cluster)
# 
# #进行可视化展示
# library(factoextra)
# fviz_cluster(km_result, data = t(df),
#              ellipse.type = "euclid",
#              star.plot = TRUE,
#              repel = TRUE,
#              ggtheme = theme_minimal()
# )
set.seed(123)
#利用k-mean是进行聚类
df <- read.csv("res_ordination_scores.csv",row.names = 1)
km_result <- kmeans(df[,1:3], 5, nstart = 41)
print(km_result)
dd <- as.data.frame(cbind(df, cluster = km_result$cluster))
table(dd$cluster)
fviz_nbclust(df[,1:3], kmeans, method = "wss") +
  geom_vline(xintercept = 5, linetype = 2)
#进行可视化展示
library(factoextra)
fviz_cluster(km_result, data = df[,1:3],
             ellipse.type = "euclid",
             palette =mycol,
             ellipse.alpha = 0.3,
             star.plot = TRUE,
             repel = TRUE,
             outlier.color = "black",
             ggtheme = theme_bw()
)
ggsave(filename = "cluster_PCOA.tiff",width = 7,height = 6,dpi = 300)
gp$Group=km_result$cluster
write.csv(gp,"group_cluster.csv")

