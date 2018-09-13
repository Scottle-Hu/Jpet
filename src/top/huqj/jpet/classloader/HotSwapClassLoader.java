package top.huqj.jpet.classloader;

/**
 * 实现热部署的类加载器
 *
 * @author huqj
 */
public class HotSwapClassLoader extends ClassLoader {

    public HotSwapClassLoader() {
        super(HotSwapClassLoader.class.getClassLoader());
    }

    public Class loadClassFromByte(byte[] classByte) {
        return defineClass(null, classByte, 0, classByte.length);
    }
    
}
