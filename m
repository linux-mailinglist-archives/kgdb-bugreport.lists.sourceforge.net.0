Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A1025C0FF
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  3 Sep 2020 14:29:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kDoN3-0001jd-EC
	for lists+kgdb-bugreport@lfdr.de; Thu, 03 Sep 2020 12:29:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kDoN2-0001jV-EO
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Sep 2020 12:29:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FOLTzf/XO+P7QNOPhKxlSTfK9nSZlqcSxLohkx+kXno=; b=lsvrZ6u7Sv5ZbKWzZUk6ch2CAT
 OUkDngl5ZyEuCahbEoJUhICJw2bbM1V60IcFpVNkr+LF4ep2KeI5MTl4JLhJLUN3aXvlccQ0AzJWc
 oWTM1WiWmA7L9KfGWIWWFFKR1tsQRhvFoSBn6I8dLROMUwpoqEmGxKm7nhZYwfCGmOqc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FOLTzf/XO+P7QNOPhKxlSTfK9nSZlqcSxLohkx+kXno=; b=d1VGjGXMYUdeb7QGypGdy7a2Q2
 0oU1hK+LOluYUGxeWLbiPMOiZ67XEuWgxTxnHuu1ZNJdz+cOjyPgqL7jvYD5N4SsCMiR1b9NihDVP
 AcEwrfRba+4UCcimCQ5TgBz4kUSUpsXQsGMOv8rSLnAOmYaJqe1K2VkR5g7ntBpDdj9c=;
Received: from mail-qv1-f68.google.com ([209.85.219.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kDoMt-00BO9U-71
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Sep 2020 12:29:40 +0000
Received: by mail-qv1-f68.google.com with SMTP id j10so1176835qvk.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 03 Sep 2020 05:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=FOLTzf/XO+P7QNOPhKxlSTfK9nSZlqcSxLohkx+kXno=;
 b=DvbGunJ3jVOhcpKidYgRLJomJssy0XrlfofrGt6ER9y6uEGB5CxvcxQ7m3YR7QmKzZ
 QHIleoxPUlkjZdjZHbbbWX85vS/A1jf8BglOTY5mxEskkB4Bjv9u5nv0/f+Fi86k27KQ
 ORkzIn9/NrlgdBdWzPUW4YGq8RQWVetEnkBGzDmjp/yXneZDAiR2ThMO91x3Kxo6+Q34
 ifFRwkmJa+7I16clQHdtc5GebdYH26Htu4SmECb1T1+QqINFKHYkIac1N7SzFgPql65t
 xnezWLYtG4rFo0nv0Nv1YD+PeGg42adBXMjErE6/A99Oo8art6QEoTmUId2MrXpyKxEf
 EDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FOLTzf/XO+P7QNOPhKxlSTfK9nSZlqcSxLohkx+kXno=;
 b=ql4fn1rAI0gJvTds1fSUSsgGuuzGCr0g7GnLUNHta3DW/157JwfN3iNCV4hR/22X9I
 9siDjVqtmL8DT/F0VUHghNt6Xttk1EXqNHGCm12P3SInMl/lBr+Yn2xXjb2RSjiTZxwV
 VgzC5oeB31DMV5ioHCScoyoJCkEhIMX+NejiYu078kWJgL5VTfSJDBA3drw0VyJx3sv2
 7VT9d8/nD2/6wRMRYDSd6Qs9rWA8sDAsf2a1DWvbtFNdf/wj6ru2Dp/FFIP9pgH7rRLB
 xXj2gwUj74Od+nHNJg7Wsq/GlhJcypsjNqd0PXi6v/jxuoChw01yzwXWOdr48g2CSYI8
 PleQ==
X-Gm-Message-State: AOAM533VnQhi6oXa6N87qcrsiQGh08n4Zock565SUnS4ei7zk/KZO1Cx
 UsFYwSFw1uYgPkmvWE/CvKarnDJoOosQEw==
X-Google-Smtp-Source: ABdhPJx69wueSgaulyBljwP5X2r7+JVhzDLt3bpKRIsvkt68un6f73FkRk63fK9P/WX/0/tFU0EDQA==
X-Received: by 2002:a62:cf04:: with SMTP id b4mr3500815pfg.84.1599134740520;
 Thu, 03 Sep 2020 05:05:40 -0700 (PDT)
Received: from localhost.localdomain ([117.210.209.248])
 by smtp.gmail.com with ESMTPSA id s1sm2922022pgh.47.2020.09.03.05.05.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Sep 2020 05:05:39 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Date: Thu,  3 Sep 2020 17:35:08 +0530
Message-Id: <1599134712-30923-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.68 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lkml.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kDoMt-00BO9U-71
Subject: [Kgdb-bugreport] [PATCH v3 0/4] arm64: Introduce new IPI as
 IPI_CALL_NMI_FUNC
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
Cc: daniel.thompson@linaro.org, jason@lakedaemon.net,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jason.wessel@windriver.com,
 tglx@linutronix.de, julien.thierry.kdev@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

With pseudo NMIs support available its possible to configure SGIs to be
triggered as pseudo NMIs running in NMI context. And kernel features
such as kgdb relies on NMI support to round up CPUs which are stuck in
hard lockup state with interrupts disabled.

This patch-set adds support for IPI_CALL_NMI_FUNC which can be triggered
as a pseudo NMI which in turn is leveraged via kgdb to round up CPUs.

After this patch-set we should be able to get a backtrace for a CPU
stuck in HARDLOCKUP. Have a look at an example below from a testcase run
on Developerbox:

$ echo HARDLOCKUP > /sys/kernel/debug/provoke-crash/DIRECT

# Enter kdb via Magic SysRq

[11]kdb> btc
btc: cpu status: Currently on cpu 10
Available cpus: 0-7(I), 8, 9(I), 10, 11-23(I)
<snip>
Stack traceback for pid 619
0xffff000871bc9c00      619      618  1    8   R  0xffff000871bca5c0  bash
CPU: 8 PID: 619 Comm: bash Not tainted 5.7.0-rc6-00762-g3804420 #77
Hardware name: Socionext SynQuacer E-series DeveloperBox, BIOS build #73 Apr  6 2020
Call trace:
 dump_backtrace+0x0/0x198
 show_stack+0x18/0x28
 dump_stack+0xb8/0x100
 kgdb_cpu_enter+0x5c0/0x5f8
 kgdb_nmicallback+0xa0/0xa8
 ipi_kgdb_nmicallback+0x24/0x30
 ipi_handler+0x160/0x1b8
 handle_percpu_devid_fasteoi_ipi+0x44/0x58
 generic_handle_irq+0x30/0x48
 handle_domain_nmi+0x44/0x80
 gic_handle_irq+0x140/0x2a0
 el1_irq+0xcc/0x180
 lkdtm_HARDLOCKUP+0x10/0x18
 direct_entry+0x124/0x1c0
 full_proxy_write+0x60/0xb0
 __vfs_write+0x1c/0x48
 vfs_write+0xe4/0x1d0
 ksys_write+0x6c/0xf8
 __arm64_sys_write+0x1c/0x28
 el0_svc_common.constprop.0+0x74/0x1f0
 do_el0_svc+0x24/0x90
 el0_sync_handler+0x178/0x2b8
 el0_sync+0x158/0x180

Changes in v3:
- Rebased to Marc's latest IPIs patch-set [1].

[1] https://lkml.org/lkml/2020/9/1/603

Changes since RFC version [1]:
- Switch to use generic interrupt framework to turn an IPI as NMI.
- Dependent on Marc's patch-set [2] which turns IPIs into normal
  interrupts.
- Addressed misc. comments from Doug on patch #4.
- Posted kgdb NMI printk() fixup separately which has evolved since
  to be solved using different approach via changing kgdb interception
  of printk() in common printk() code (see patch [3]).

[1] https://lkml.org/lkml/2020/4/24/328
[2] https://lkml.org/lkml/2020/5/19/710
[3] https://lkml.org/lkml/2020/5/20/418

Sumit Garg (4):
  arm64: smp: Introduce a new IPI as IPI_CALL_NMI_FUNC
  irqchip/gic-v3: Enable support for SGIs to act as NMIs
  arm64: smp: Setup IPI_CALL_NMI_FUNC as a pseudo NMI
  arm64: kgdb: Round up cpus using IPI_CALL_NMI_FUNC

 arch/arm64/include/asm/kgdb.h |  8 +++++++
 arch/arm64/include/asm/smp.h  |  1 +
 arch/arm64/kernel/kgdb.c      | 21 ++++++++++++++++++
 arch/arm64/kernel/smp.c       | 50 ++++++++++++++++++++++++++++++++++---------
 drivers/irqchip/irq-gic-v3.c  | 13 +++++++++--
 5 files changed, 81 insertions(+), 12 deletions(-)

-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
