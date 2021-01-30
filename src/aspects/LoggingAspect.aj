package aspects;

import java.util.Arrays;
import java.util.logging.Logger;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.After;

@Aspect
public aspect LoggingAspect {
	@Before("execution(* client.Hello.*(..))")
	public void beforeRun(JoinPoint joinPoint) {
		Object target = joinPoint.getTarget();
		String methodName = joinPoint.getSignature().getName();
		Object[] args = joinPoint.getArgs();
		Logger.getLogger(target.getClass().getName()).info(String.format("%s %s.%s(%s)", "This is Logging aspect", target.getClass().getName(), methodName, Arrays.toString(args)));	
	}
	
	@After("execution(* client.Hello.*(..))")
	public void afterRun(JoinPoint joinPoint) {
		Object target = joinPoint.getTarget();
		String methodName = joinPoint.getSignature().getName();
		Object[] args = joinPoint.getArgs();
		Logger.getLogger(target.getClass().getName()).info(String.format("%s %s.%s(%s)", "This is Logging aspect", target.getClass().getName(), methodName, Arrays.toString(args)));	
	}
//	before(): execution(* client.Hello.*(..)){
//		Object target = thisJoinPoint.getTarget();
//		String methodName = thisJoinPoint.getSignature().getName();
//		Object[] args = thisJoinPoint.getArgs();
//		Logger.getLogger(target.getClass().getName()).info(String.format("%s.%s(%s)", target.getClass().getName(), methodName, Arrays.toString(args)));
//	}
}
