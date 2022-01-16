# A/B Test

1. 

![image-20220111233218104](https://raw.githubusercontent.com/ShaunZhxiong/ImgGarage/main/img/image-20220111233218104.png)



2.  Statistical Power

   If we see something interesting, we want to make sure we have enough power to conclude with high probability that the interesting result is statistically significant

   **The Power has an inverst trade-off with size**

   > The samller the change that you want to detect, or the increased confidence that you basically want to have in the result, means that you have to run a large experiement

![image-20220111235017036](https://raw.githubusercontent.com/ShaunZhxiong/ImgGarage/main/img/image-20220111235017036.png)

3. How to calculate the sample size

   ![image-20220111235144189](https://raw.githubusercontent.com/ShaunZhxiong/ImgGarage/main/img/image-20220111235144189.png)

[Online Calculator](https://www.evanmiller.org/ab-testing/sample-size.html)

![image-20220112000154775](https://raw.githubusercontent.com/ShaunZhxiong/ImgGarage/main/img/image-20220112000154775.png)[Solution Video](https://classroom.udacity.com/courses/ud257/lessons/4018018619/concepts/40043987090923)



> **Exercise: Should we apply the change?**

![image-20220112000845816](https://raw.githubusercontent.com/ShaunZhxiong/ImgGarage/main/img/image-20220112000845816.png)

> **Another Exercise Practice**

![image-20220112001427763](https://raw.githubusercontent.com/ShaunZhxiong/ImgGarage/main/img/image-20220112001427763.png)



3. Metrics

Metrics的唯二两个种类

- Invariant checking (Sanity checking metrics)

> metrics that shouldn't change across your experiment and your control

- Evaluation metrics

> Can be multiple metrics, even we can use OEC to combine multiple metrics into a compositive one.

Metrics 的两种类型

a. high level business metrics

b. detailed metrics

[Additional  Techniques  for  Brainstorming  and  Validating  Metrics](ABTest_additional_techniques.pdf)



4. The ways to gather metrics

   ![image-20220115182736742](https://raw.githubusercontent.com/ShaunZhxiong/ImgGarage/main/img/image-20220115182736742.png)

![image-20220115183240356](https://raw.githubusercontent.com/ShaunZhxiong/ImgGarage/main/img/image-20220115183240356.png)

![image-20220115204051820](https://raw.githubusercontent.com/ShaunZhxiong/ImgGarage/main/img/image-20220115204051820.png)



衡量metrics的两个指标：

- Robustness：当没有变化的时候，能否保持稳定在不同样本之间

- Sensitivity：能否有效地感知到变化



To calculate the variability

![image-20220115211153197](https://raw.githubusercontent.com/ShaunZhxiong/ImgGarage/main/img/image-20220115211153197.png)



A/A test: Empirical Variability

![image-20220115212335258](https://raw.githubusercontent.com/ShaunZhxiong/ImgGarage/main/img/image-20220115212335258.png)



# Lesson 3 Design the experiment

Unit of diversion:

![image-20220115215138088](https://raw.githubusercontent.com/ShaunZhxiong/ImgGarage/main/img/image-20220115215138088.png)



Using cohorts in experiment

![image-20220115222753527](https://raw.githubusercontent.com/ShaunZhxiong/ImgGarage/main/img/image-20220115222753527.png)



[Calculate the sample size]("D:\OneDrive\WORK\Upenn\Coding-Exp\sizingofABTest.R")



Tracking multiple metrics: Bonferroii Correction

![image-20220116132657913](https://raw.githubusercontent.com/ShaunZhxiong/ImgGarage/main/img/image-20220116132657913.png)



Familywise error rate (FWER)

False discover rate (FDR)

![image-20220116133106718](https://raw.githubusercontent.com/ShaunZhxiong/ImgGarage/main/img/image-20220116133106718.png)





# Wrap up

下面是本课程中的脉络和重点梳理：

课程1：A/B测试概览

1. A/B试验简介：A/B测试是什么，可以应用于什么场合
2. 二项分布：A/B测试中有很多基于“是否”的问题，比如“是否点击”、“是否注册”，这些分布都属于二项分布，通过对二项分布的学习，我们会知道如何来计算置信区间（置信区间可以用来判断统计显著性和实际显著性）。

课程2：试验中的政策和伦理问题

课程3：选择和测量指标

1. 如何选择不变度量和评估度量
2. 计算评估度量的标准偏差/可变性（[原因](http://discussions.youdaxue.com/t/topic/46577)）
3. 分析与实证可变性（[区别](http://discussions.youdaxue.com/t/topic/43495)）

课程4：设计试验

1. 分析单位和引流单位：在设计试验和选择度量的时候需要确保引流的一致性。
2. 样本容量的计算方法，以及影响样本容量的因素
3. 根据样本容量计算试验的持续时间

课程5：分析结果

1. 对不变度量进行完整性检查，又叫健全性检查sanity check
2. 对评估度量进行效应量检查，也就是根据置信区间来判断是否具有统计和实际显著性（单个评估指标）
3. 对评估度量进行符号检验（单个评估指标）
4. Bonferroni校正（多个评估指标）

具体每个知识点的解释也可以从[论坛](http://discussions.youdaxue.com/c/dand-p7)中找到。