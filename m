Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C478816772
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 18 Dec 2023 08:34:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rF892-0002xZ-Eo
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 18 Dec 2023 07:34:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <michael@amarulasolutions.com>) id 1rF892-0002xT-0k
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 18 Dec 2023 07:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=olULgM359/ngO2eLxqKPg4Bd8lNvjNS8Vgzy23+KEiE=; b=lkulfQiimsr3J+r+Eto+TxvGLJ
 gkPDU8fQyhBg0NK382+YMWSgfgAhn9ob4b4Ivd8wLf/29olQ+7MHsg4uppLx/ML7z8b3RQJWa8iJu
 zl3+DnNe8F5Pxc2dvHUdKrtgYY4rcH0QLSoCcGfayWPGiUWBWCqO7qIU9Y5pmWvsdW3s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=olULgM359/ngO2eLxqKPg4Bd8lNvjNS8Vgzy23+KEiE=; b=Jgpx+ZoTCEd+C8qgrxGfWkqYvw
 S1UvsyE5yDcx4GUKcPl07CoBlRwfHbof9H2PKv886VCiNFFd0sXntDu4/WZkO2f6+fdYVBc4L4Sih
 tVm9l6SoIjn1BysKdaEfGVRoSWwTUCMSaKlOw0CQBjh4mX8Rk+zZqpYD/S6yy6ol5qO8=;
Received: from mail-wm1-f54.google.com ([209.85.128.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rF88u-00034h-IZ for kgdb-bugreport@lists.sourceforge.net;
 Mon, 18 Dec 2023 07:34:32 +0000
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-40c6e2a47f6so25704115e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 17 Dec 2023 23:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702884850; x=1703489650;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=olULgM359/ngO2eLxqKPg4Bd8lNvjNS8Vgzy23+KEiE=;
 b=qb5MHoDegEw4S6vsHiPqNVSI8ZggiKO/Ih6u11h2f9jhrgSVrr/w7Dxmi4MFku9r43
 BXWR65zPYMqKY8/C5qGGsETGR+alDw1WREBgEYJF/qJ6zPdHbNWHcuPkMlyGfjv9Datg
 mgSs9HpjJuKe8DRRFVP4JFnnwgl3j7pUTQrE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702884850; x=1703489650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=olULgM359/ngO2eLxqKPg4Bd8lNvjNS8Vgzy23+KEiE=;
 b=dpTYZLcwIwcNZPKW4APg0mLayE047J6Hf/8qhk7y7jG3m4uZCxBJal6AuTV9gwj4uW
 Ia0HVnjiDRLNpvL1AlesSQLjGKH+kuU3mV5CzhP9x7aRZg6XZE2Phsi6l8pfXta4DSlv
 bhBOEAAwxge4RPts+nrOGHnlBYwxsr4QpzS8cMn2PlMoKM93y71iEEYiR2X8oXjU5Ttb
 v2E02EU43Tx7CayEAA7hKtpxH/l9AwqWHxfabhJcIgmGQznM0qUqHOEMel6h8JdNQrY2
 DirBcy2L/SdXKujpvZs4dAH4KUSzD0PcfagixO+2Fg4kDKSekP1f2XvgM7uBT79RLg2Y
 DAAg==
X-Gm-Message-State: AOJu0YxOVadnVGA1jg7VUGuDxBvaaANujAHnNpHI/8V5z4Nv3T2uU2BC
 5A/b29aJjs8ljrnJJfiVkwZ2ZQ==
X-Google-Smtp-Source: AGHT+IHC5jYHllOjb186unx3YfcDbKt7AIbFqpN8EjgWqZvjfYR4lwv1hDUQzlnE34dKvK9KzZNUBw==
X-Received: by 2002:a7b:ca54:0:b0:40c:2db0:c803 with SMTP id
 m20-20020a7bca54000000b0040c2db0c803mr4103238wml.92.1702884850242; 
 Sun, 17 Dec 2023 23:34:10 -0800 (PST)
Received: from panicking.QSD (net-91-81-8-146.cust.vodafonedsl.it.
 [91.81.8.146]) by smtp.gmail.com with ESMTPSA id
 iv19-20020a05600c549300b0040b397787d3sm37153199wmb.24.2023.12.17.23.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Dec 2023 23:34:09 -0800 (PST)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: michael@amarulasolutions.com
Date: Mon, 18 Dec 2023 08:34:07 +0100
Message-Id: <20231218073407.300982-1-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231216173409.1264655-1-michael@amarulasolutions.com>
References: <20231216173409.1264655-1-michael@amarulasolutions.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Check if port type is not PORT_UNKNOWN during poll_init. The
 kgdboc calls the tty_find_polling_driver that check if the serial is able
 to use poll_init. The poll_init calls the uart uart_poll_init tha [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.54 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.54 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rF88u-00034h-IZ
Subject: [Kgdb-bugreport] [PATCH V2] tty: serial: kgdboc: Fix 8250_* kgd
 over serial
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: daniel.thompson@linaro.org, kgdb-bugreport@lists.sourceforge.net,
 jason.wessel@windriver.com, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Check if port type is not PORT_UNKNOWN during poll_init.
The kgdboc calls the tty_find_polling_driver that check
if the serial is able to use poll_init. The poll_init calls
the uart uart_poll_init that try to configure the uart with the
selected boot parameters. The uart must be ready before setting
parameters. Seems that PORT_UNKNOWN is already used by other
functions in serial_core to detect uart status, so use the same
to avoid to use it in invalid state.

The crash happen for instance in am62x architecture where the 8250
register the platform driver after the 8250 core is initialized.

Follow the report crash coming from KGDB

Thread 2 received signal SIGSEGV, Segmentation fault.
[Switching to Thread 1]
_outb (addr=<optimized out>, value=<optimized out>) at ./include/asm-generic/io.h:584
584		__raw_writeb(value, PCI_IOBASE + addr);
(gdb) bt

This section of the code is too early because in this case
the omap serial is not probed

Thread 2 received signal SIGSEGV, Segmentation fault.
[Switching to Thread 1]
_outb (addr=<optimized out>, value=<optimized out>) at ./include/asm-generic/io.h:584
584		__raw_writeb(value, PCI_IOBASE + addr);
(gdb) bt

Thread 2 received signal SIGSEGV, Segmentation fault.
[Switching to Thread 1]
_outb (addr=<optimized out>, value=<optimized out>) at ./include/asm-generic/io.h:584
584		__raw_writeb(value, PCI_IOBASE + addr);
(gdb) bt
0  _outb (addr=<optimized out>, value=<optimized out>) at ./include/asm-generic/io.h:584
1  logic_outb (value=0 '\000', addr=18446739675637874689) at lib/logic_pio.c:299
2  0xffff80008082dfcc in io_serial_out (p=0x0, offset=16760830, value=0) at drivers/tty/serial/8250/8250_port.c:416
3  0xffff80008082fe34 in serial_port_out (value=<optimized out>, offset=<optimized out>, up=<optimized out>)
    at ./include/linux/serial_core.h:677
4  serial8250_do_set_termios (port=0xffff8000828ee940 <serial8250_ports+1568>, termios=0xffff80008292b93c, old=0x0)
    at drivers/tty/serial/8250/8250_port.c:2860
5  0xffff800080830064 in serial8250_set_termios (port=0xfffffbfffe800000, termios=0xffbffe, old=0x0)
    at drivers/tty/serial/8250/8250_port.c:2912
6  0xffff80008082571c in uart_set_options (port=0xffff8000828ee940 <serial8250_ports+1568>, co=0x0, baud=115200, parity=110, bits=8, flow=110)
    at drivers/tty/serial/serial_core.c:2285
7  0xffff800080828434 in uart_poll_init (driver=0xfffffbfffe800000, line=16760830, options=0xffff8000828f7506 <config+6> "115200n8")
    at drivers/tty/serial/serial_core.c:2656
8  0xffff800080801690 in tty_find_polling_driver (name=0xffff8000828f7500 <config> "ttyS2,115200n8", line=0xffff80008292ba90)
    at drivers/tty/tty_io.c:410
9  0xffff80008086c0b0 in configure_kgdboc () at drivers/tty/serial/kgdboc.c:194
10 0xffff80008086c1ec in kgdboc_probe (pdev=0xfffffbfffe800000) at drivers/tty/serial/kgdboc.c:249
11 0xffff8000808b399c in platform_probe (_dev=0xffff000000ebb810) at drivers/base/platform.c:1404
12 0xffff8000808b0b44 in call_driver_probe (drv=<optimized out>, dev=<optimized out>) at drivers/base/dd.c:579
13 really_probe (dev=0xffff000000ebb810, drv=0xffff80008277f138 <kgdboc_platform_driver+48>) at drivers/base/dd.c:658
14 0xffff8000808b0d2c in __driver_probe_device (drv=0xffff80008277f138 <kgdboc_platform_driver+48>, dev=0xffff000000ebb810)
    at drivers/base/dd.c:800
15 0xffff8000808b0eb8 in driver_probe_device (drv=0xfffffbfffe800000, dev=0xffff000000ebb810) at drivers/base/dd.c:830
16 0xffff8000808b0ff4 in __device_attach_driver (drv=0xffff80008277f138 <kgdboc_platform_driver+48>, _data=0xffff80008292bc48)
    at drivers/base/dd.c:958
17 0xffff8000808ae970 in bus_for_each_drv (bus=0xfffffbfffe800000, start=0x0, data=0xffff80008292bc48,
    fn=0xffff8000808b0f3c <__device_attach_driver>) at drivers/base/bus.c:457
18 0xffff8000808b1408 in __device_attach (dev=0xffff000000ebb810, allow_async=true) at drivers/base/dd.c:1030
19 0xffff8000808b16d8 in device_initial_probe (dev=0xfffffbfffe800000) at drivers/base/dd.c:1079
20 0xffff8000808af9f4 in bus_probe_device (dev=0xffff000000ebb810) at drivers/base/bus.c:532
21 0xffff8000808ac77c in device_add (dev=0xfffffbfffe800000) at drivers/base/core.c:3625
22 0xffff8000808b3428 in platform_device_add (pdev=0xffff000000ebb800) at drivers/base/platform.c:716
23 0xffff800081b5dc0c in init_kgdboc () at drivers/tty/serial/kgdboc.c:292
24 0xffff800080014db0 in do_one_initcall (fn=0xffff800081b5dba4 <init_kgdboc>) at init/main.c:1236
25 0xffff800081b0114c in do_initcall_level (command_line=<optimized out>, level=<optimized out>) at init/main.c:1298
26 do_initcalls () at init/main.c:1314
27 do_basic_setup () at init/main.c:1333
28 kernel_init_freeable () at init/main.c:1551
29 0xffff8000810271ec in kernel_init (unused=0xfffffbfffe800000) at init/main.c:1441
30 0xffff800080015e80 in ret_from_fork () at arch/arm64/kernel/entry.S:857

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
v1 -> v2:
	- fix if condition during submission
	- improve a bit the commit message
RFC -> v1:
        - refuse uart that has type PORT_UNKNOWN

---
 drivers/tty/serial/serial_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index f1348a509552..9b7ed4aac77a 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -2633,7 +2633,7 @@ static int uart_poll_init(struct tty_driver *driver, int line, char *options)
 	mutex_lock(&tport->mutex);
 
 	port = uart_port_check(state);
-	if (!port || !(port->ops->poll_get_char && port->ops->poll_put_char)) {
+	if (!port || port->type == PORT_UNKNOWN || !(port->ops->poll_get_char && port->ops->poll_put_char)) {
 		ret = -1;
 		goto out;
 	}
-- 
2.40.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
