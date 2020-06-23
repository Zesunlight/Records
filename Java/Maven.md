## Maven

- Apache Maven 是一个项目管理和自动化构建工具，基于项目对象模型（POM）的概念，可以管理项目的构建、报告以及文档

- Maven 主要服务于基于 Java 的项目构建、依赖管理和项目信息管理。

- Maven 采用了约定优先配置的原则

  | 目录                            | 目的                                        |
  | :------------------------------ | :------------------------------------------ |
  | `${basedir}`                    | 存放 pom.xml 和所有的子目录                 |
  | `${basedir}/src/main/java`      | 存放 Java 源代码                            |
  | `${basedir}/src/main/resources` | 存放项目的资源文件，比如说 log4j.properties |
  | `${basedir}/src/test/java`      | 存放测试类                                  |
  | `${basedir}/src/test/resources` | 存放测试用的资源                            |
  | `${basedir}/src/main/webapp`    | 存放 Web 前端文件                           |
  | `${basedir}/target`             | 项目打包后的输出目录                        |
  | `${basedir}/target/classes`     | 项目编译后输出目录                          |
  | `~/.m2/repository`              | 默认的 Maven 仓库目录（~表示用户目录）      |

- 通过一个三维的坐标（`<groupId>`、`<artifactId>`、`<version>`）来准确地定位每一个开源类库。
- Maven 的 conf 目录下包含了一个非常重要的文件 settings.xml，一般情况下，倾向于将该文件复制到 `~/.m2/` 目录下

### pom.xml 文件

#### 项目基本信息

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
<modelVersion>4.0.0</modelVersion>

<groupId>com.cmower</groupId>
<artifactId>test</artifactId>
<version>0.0.1-SNAPSHOT</version>
<packaging>jar</packaging>

<name>test</name>

</project> 
```

①、`project` 是 pom.xml 的根元素，声明了相关的命名空间。

②、`modelVersion` 指定了当前项目对象模型（POM）的版本，对于 Maven 3.x 来说，该值只能是 4.0.0。

③、`groupId` 定义了项目的组名，这个组往往和项目所在的组织或公司关联。

④、`artifactId` 定义了当前 Maven 项目在组中唯一的 ID。

⑤、`version` 定义了项目的版本号，`SNAPSHOT` 为快照的意思，也就是说该项目还处于开发阶段。

⑥、`packaging` 定义了项目的打包类型，可选值有 war、jar 等。

⑦、`name` 定义了项目的名称。

#### 变量配置信息

```xml
<properties>
	<spring.version>5.1.5.RELEASE</spring.version>
</properties>
```

- 可以通过 `${spring.version}` 的形式来调用这些配置项

#### 依赖管理

```xml
<dependencies>
    <dependency>
        <groupId>junit</groupId>
        <artifactId>junit</artifactId>
        <version>3.8.1</version>
        <scope>test</scope>
    </dependency>
    
    <dependency>
        <groupId>org.springframework</groupId>
        <artifactId>spring-core</artifactId>
        <version>${spring.version}</version>
        
        <exclusions>
            <exclusion>
                <groupId>commons-logging</groupId>
                <artifactId>commons-logging</artifactId>
            </exclusion>
        </exclusions>
    </dependency>

    <dependency>
        <groupId>commons-logging</groupId>
        <artifactId>commons-logging</artifactId>
        <version>1.1.1</version>
    </dependency>
</dependencies>
```

-  Maven Repository: http://mvnrepository.com 

- `exclusions` 主要用于排除依赖，引入的依赖中可能会包含一些不想要的依赖包，只需要指定 `groupId` 和 `artifactId` 就可以排除

- `scope` 用来控制依赖的范围

  **test**：测试依赖范围。典型的例子是 Jnuit，它只有在编译测试代码及运行测试的时候才需要。

  **compile**：编译依赖范围（其实不止是编译，对测试、运行同样有效），缺省项，如果没有指定，就会默认使用该依赖范围。

  **provided**：提供依赖范围。对编译和测试有效，但在运行时候无效。

  **runtime**：运行时依赖范围。对测试和运行有效，但在编译时无效。

#### 构建配置

```xml
<build>
    <finalName>test</finalName>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-compiler-plugin</artifactId>
            <version>2.3.2</version>
            <configuration>
                <source>${jdk.version}</source>
                <target>${jdk.version}</target>
            </configuration>
        </plugin>
    </plugins>

    <resources>
        <resource>
        	<directory>src/main/java</directory>
            <includes>
            	<include>**/*.xml</include>
            </includes>
        </resource>
    </resources>
</build>
```

- `finalName`，打成 jar 包或者 war 包时的名称。上文中曾提到，项目打包后的输出目录为 `${basedir}/target`。

- `plugins` 用于指定项目在构建过程中使用的插件。
  - `groupId`、`artifactId`、`version` 用于确定使用的插件。
  - `configuration`，该插件所需要的特殊配置。Maven 3 默认使用的是 JDK 1.5。

- `resources` 描述了各个资源在 Maven 项目中的具体路径。
  - `directory`，资源文件的路径，默认位于 `${basedir}/src/main/resources/` 目录下。
  - `includes`，用于指定在构建过程中被处理的资源文件；对应 `exculds` 用于省去不被处理的资源文件。

## 参考

- http://www.justdojava.com/2019/06/22/maven/