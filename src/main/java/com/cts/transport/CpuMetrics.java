package com.cts.transport;
import java.lang.management.ManagementFactory;
import java.util.*;
import javax.annotation.PostConstruct;
import javax.management.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import io.micrometer.core.instrument.*;
@Component
public class CpuMetrics {
    private final static String METRICS_NAME = "system.cpu.usage";
    @Autowired
    private MeterRegistry meterRegistry;
    @PostConstruct
    public void init() {
        Gauge.builder(METRICS_NAME, this, CpuMetrics::getSystemCpuLoad)
            .baseUnit("%")
            .description("CPU Usage")
            .register(meterRegistry);
    }
    public Double getSystemCpuLoad() {
        try {
            MBeanServer mbs = ManagementFactory.getPlatformMBeanServer();
            ObjectName name = ObjectName.getInstance("java.lang:type=OperatingSystem");
            AttributeList list = mbs.getAttributes(name, new String[]{"SystemCpuLoad"});

            return Optional.ofNullable(list)
                    .map(l -> l.isEmpty() ? null : l)
                    .map(List::iterator)
                    .map(Iterator::next)
                    .map(Attribute.class::cast)
                    .map(Attribute::getValue)
                    .map(Double.class::cast)
                    .orElse(null);
        } catch (Exception ex) {
            return null;
        }
    }
}