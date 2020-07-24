## [Spring IOC & AOP](https://snailclimb.gitee.io/javaguide/#/docs/system-design/framework/spring/SpringInterviewQuestions?id=_4-spring-ioc-amp-aop)

### IoC

- IoC（Inverse of Control:控制反转）是一种**设计思想**，就是将原本在程序中手动创建对象的控制权，交由Spring框架来管理。
- IoC 容器是 Spring 用来实现 IoC 的载体， IoC 容器实际上就是个Map（key，value）,Map 中存放的是各种对象。

- 将对象之间的相互依赖关系交给 IoC 容器来管理，并由 IoC 容器完成对象的注入。这样可以很大程度上简化应用的开发，把应用从复杂的依赖关系中解放出来。
- IoC 容器就像是一个工厂一样，当我们需要创建一个对象的时候，只需要配置好配置文件/注解即可，完全不用考虑对象是如何被创建出来的。

- ioc的思想最核心的地方在于，资源不由使用资源的双方管理，而由不使用资源的第三方管理，这可以带来很多好处。第一，资源集中管理，实现资源的可配置和易管理。第二，降低了使用资源双方的依赖程度，也就是我们说的耦合度。
- IoC 最常见以及最合理的实现方式叫做依赖注入（Dependency Injection，简称 DI）。
- 依赖注入可以通过setter方法注入、构造器Cibstruct注入和接口注入三种方式来实现，Spring支持setter注入和构造器注入，通常使用构造器注入来注入必须的依赖关系，对于可选的依赖关系，则setter注入是更好的选择
- Spring IoC有什么好处呢？ - Mingqi的回答 - 知乎
  https://www.zhihu.com/question/23277575/answer/169698662

### AOP

- AOP(Aspect-Oriented Programming:面向切面编程)能够将那些与业务无关，却为业务模块所共同调用的逻辑或责任（例如事务处理、日志管理、权限控制等）封装起来，便于减少系统的重复代码，降低模块间的耦合度，并有利于未来的可拓展性和可维护性。

- Spring AOP就是基于动态代理的
- 在不改变原有业务逻辑的情况下，增强横切逻辑代码，根本上解耦合，避免横切逻辑代码重复。
- AOP利用一种称为"横切"的技术，剖解开封装的对象内部，并将那些影响了多个类的公共行为封装到一个可重用模块

### 其他

- @Autowired表示被修饰的类需要注入对象,spring会扫描所有被@Autowired标注的类,然后根据 类型 在ioc容器中找到匹配的类注入