package com.example;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.example.mapper")
public class SpringbootApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringbootApplication.class, args);
        System.out.println("\n================================ 郑重声明 =================================");
        System.out.println("|                                                                       |");
        System.out.println("|  本平台已经对本项目申请了软件著作权，完善了所有该项目资源相关的法律文件材料。\t\t\t|");
        System.out.println("|  本平台付费用户可以学习该项目自己使用，禁止在其他平台做转手或者倒卖，\t\t\t\t|");
        System.out.println("|  禁止在私域未经授权分享源码，禁止上传代码到github、gitee、gitlab等代码托管平台。\t|");
        System.out.println("|  我们公司的法务会在各大平台（例如：闲鱼、小红书、B站、CSDN等社交媒体平台）不定期检索，\t|");
        System.out.println("|  一旦发现倒卖或转手的现象，我们会第一时间收集好证据，向你发送律师函。\t\t\t\t|");
        System.out.println("|  现在互联网所有账号都是实名制，我们可以明确追溯到你。\t\t\t\t\t\t\t|");
        System.out.println("|  请大家不要做违法的事情，不要因为一时糊涂给自己的人生轨迹抹上一层黑！\t\t\t\t|");
        System.out.println("|  本项目唯一官方平台：项目实战网（https://www.javaxmsz.cn）\t\t\t\t\t|");
        System.out.println("|                                                                       |");
        System.out.println("================================ 郑重声明 =================================");
    }

}
