Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC87B227FA8
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 21 Jul 2020 14:11:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jxr6p-0001Kw-M7
	for lists+kgdb-bugreport@lfdr.de; Tue, 21 Jul 2020 12:10:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jxr6o-0001Km-D7
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Jul 2020 12:10:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DUhxoUHdk/G5hcIoHHmedsybYx4YWFvLP5ZmToBFcQA=; b=kgjulztc+mX5COHD83Ff8Jvfq7
 jnWtA1gtJ7XXfb6lT97NvKm7ZPiQaNrS0Y4oqcftTtu7/+2fwB/c8U6ghsfLLD+92RYb+rC0Q5zGN
 EXf1djOgXgiW+sBoDH5TFbblFcc/Im9rnGbNJIedJZya6lm7gNmHMq9yUz+is3dexhyg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DUhxoUHdk/G5hcIoHHmedsybYx4YWFvLP5ZmToBFcQA=; b=T1UQOXIwdYczWaxEMeI0ucXq7E
 zmVg5JqxAqE/JG1qEwypJUy7uUi7LdnbTyOHQIgEsOI9Kp/miHNdY9/H+TAOD8XV7EhYofUIVx/p+
 uQINi2Vpgw4qnBgpXs74ilb359Zao3m2qs7mCM0+XjMOQhVZCmo4xAIvia9K2JvTudRs=;
Received: from mail-pj1-f66.google.com ([209.85.216.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jxr6j-00C1vL-ME
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Jul 2020 12:10:58 +0000
Received: by mail-pj1-f66.google.com with SMTP id k5so1578697pjg.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 21 Jul 2020 05:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=DUhxoUHdk/G5hcIoHHmedsybYx4YWFvLP5ZmToBFcQA=;
 b=jcbCCb7hQJlHIsdcZ51dQFHY/9ZAio9o8npqoAFikBjrRS5rSX8azSndpIfoxx4pB+
 36zJ9XHfNsZaRy7DSN1DP/aiQPS1wdywIz2HH7ZUeQPS9pMnDDMBFScXUX8tkATs9D3Q
 AgbIybVi4CKkW8frVqni9KeOc3TfJHu2wgPhSRbqmU1CzyLw2BnPvo3mq5J7vWHydhVG
 ykZd7ucwFth+Pedeigm9B3p8zNkoO+gfshaZ2vqKoy3ykznGytstafoT6n4A86ml+rYT
 oMyEtsd0jdPbtn+jYCfaazIcKecvvJ9MCT/0T4bbqk2TDYe3Ou5Vdbc5vVEP2p1XGntN
 aHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=DUhxoUHdk/G5hcIoHHmedsybYx4YWFvLP5ZmToBFcQA=;
 b=twQwMeKZwS04hnyvwdPa+Rs1sEsVHJwxylUHiZC0c05JLtt7us2lgJlRiDVxXy8Ruq
 Dd+pwIHiHaVBga8tMZNZAEP3T+JplTCz0hF99vLu2prCpGEgmhsQ2s7J4Cw7uzdifC9R
 CJPg+Pyk8oLYm9NS7s2Xw9DPUxbTDIofxrzEGwErBxrok8aR0uD6itE+moymS0/M/DV7
 KFv94bd6w8ZNLvfJlhqDmxjPzAbuzye2h9KivzA3wLDDMUvQo6+pNcDHmTjzmHXahzaK
 gkM+BJJdlatD5WFelKdOl+vneT58FZTVNQppQ8/fyFBLaSg+n6cWepPflYj48bcl+vt9
 xWPA==
X-Gm-Message-State: AOAM533eNCnY9IzW+thJXMdQR3Hlob4jAlOAQ+budSRQXoBUR+FMh5+Y
 EYPBU58u7dish2Rf0Mv4jJz73A==
X-Google-Smtp-Source: ABdhPJyRExe3Qfy877FM+lq0KPlLWXAqsMqBIE5QqFOrqY5bkLpSCnvsNe2TWxlOTPk4HSLRIyix+g==
X-Received: by 2002:a17:902:d698:: with SMTP id
 v24mr21585075ply.163.1595333447996; 
 Tue, 21 Jul 2020 05:10:47 -0700 (PDT)
Received: from localhost.localdomain ([117.210.211.74])
 by smtp.gmail.com with ESMTPSA id w9sm20601992pfq.178.2020.07.21.05.10.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Jul 2020 05:10:47 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: gregkh@linuxfoundation.org, daniel.thompson@linaro.org,
 dianders@chromium.org, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net
Date: Tue, 21 Jul 2020 17:40:08 +0530
Message-Id: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.66 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jxr6j-00C1vL-ME
Subject: [Kgdb-bugreport] [RFC 0/5] Introduce NMI aware serial drivers
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
Cc: jslaby@suse.com, linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 jason.wessel@windriver.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Make it possible for UARTs to trigger magic sysrq from an NMI. With the
advent of pseudo NMIs on arm64 it became quite generic to request serial
device interrupt as an NMI rather than IRQ. And having NMI driven serial
RX will allow us to trigger magic sysrq as an NMI and hence drop into
kernel debugger in NMI context.

The major use-case is to add NMI debugging capabilities to the kernel
in order to debug scenarios such as:
- Primary CPU is stuck in deadlock with interrupts disabled and hence
  doesn't honor serial device interrupt. So having magic sysrq triggered
  as an NMI is helpful for debugging.
- Always enabled NMI based magic sysrq irrespective of whether the serial
  TTY port is active or not.

Currently there is an existing kgdb NMI serial driver which provides
partial implementation in upstream to have a separate ttyNMI0 port but
that remained in silos with the serial core/drivers which made it a bit
odd to enable using serial device interrupt and hence remained unused. It
seems to be clearly intended to avoid almost all custom NMI changes to
the UART driver.

But this patch-set allows the serial core/drivers to be NMI aware which
in turn provides NMI debugging capabilities via magic sysrq and hence
there is no specific reason to keep this special driver. So remove it
instead.

Approach:
---------

The overall idea is to intercept serial RX characters in NMI context, if
those are specific to magic sysrq then allow corresponding handler to run
in NMI context. Otherwise, defer all other RX and TX operations onto IRQ
work queue in order to run those in normal interrupt context.

This approach is demonstrated using amba-pl011 driver.

Patch-wise description:
-----------------------

Patch #1 prepares magic sysrq handler to be NMI aware.
Patch #2 adds NMI framework to serial core.
Patch #3 and #4 demonstrates NMI aware uart port using amba-pl011 driver.
Patch #5 removes kgdb NMI serial driver.

Goal of this RFC:
-----------------

My main reason for sharing this as an RFC is to help decide whether or
not to continue with this approach. The next step for me would to port
the work to a system with an 8250 UART.

Usage:
------

This RFC has been developed on top of 5.8-rc3 and if anyone is interested
to give this a try on QEMU, just enable following config options
additional to arm64 defconfig:

CONFIG_KGDB=y
CONFIG_KGDB_KDB=y
CONFIG_ARM64_PSEUDO_NMI=y

Qemu command line to test:

$ qemu-system-aarch64 -nographic -machine virt,gic-version=3 -cpu cortex-a57 \
  -smp 2 -kernel arch/arm64/boot/Image -append 'console=ttyAMA0,38400 \
  keep_bootcon root=/dev/vda2 irqchip.gicv3_pseudo_nmi=1 kgdboc=ttyAMA0' \
  -initrd rootfs-arm64.cpio.gz

NMI entry into kgdb via sysrq:
- Ctrl a + b + g

Reference:
----------

For more details about NMI/FIQ debugger, refer to this blog post [1].

[1] https://www.linaro.org/blog/debugging-arm-kernels-using-nmifiq/

I do look forward to your comments and feedback.

Sumit Garg (5):
  tty/sysrq: Make sysrq handler NMI aware
  serial: core: Add framework to allow NMI aware serial drivers
  serial: amba-pl011: Re-order APIs definition
  serial: amba-pl011: Enable NMI aware uart port
  serial: Remove KGDB NMI serial driver

 drivers/tty/serial/Kconfig       |  19 --
 drivers/tty/serial/Makefile      |   1 -
 drivers/tty/serial/amba-pl011.c  | 232 +++++++++++++++++-------
 drivers/tty/serial/kgdb_nmi.c    | 383 ---------------------------------------
 drivers/tty/serial/kgdboc.c      |   8 -
 drivers/tty/serial/serial_core.c | 120 +++++++++++-
 drivers/tty/sysrq.c              |  33 +++-
 include/linux/kgdb.h             |  10 -
 include/linux/serial_core.h      |  67 +++++++
 include/linux/sysrq.h            |   1 +
 kernel/debug/debug_core.c        |   1 +
 11 files changed, 386 insertions(+), 489 deletions(-)
 delete mode 100644 drivers/tty/serial/kgdb_nmi.c

-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
