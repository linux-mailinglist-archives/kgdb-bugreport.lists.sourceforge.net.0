Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C664CD397
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  4 Mar 2022 12:38:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nQ6G3-0001Rh-Lb
	for lists+kgdb-bugreport@lfdr.de; Fri, 04 Mar 2022 11:38:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hasegawa-hitomi@fujitsu.com>) id 1nQ1wR-0004Qi-C0
 for kgdb-bugreport@lists.sourceforge.net; Fri, 04 Mar 2022 07:01:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A+RpFOlEuJHnJX/RXvQgZnIYOIQdsuYlk0HZClr17QI=; b=kEg/hElp1X7W4w6m/bd70GGLIS
 U+0S4WoOptR8vbQxtmWSFRT7PINJK1MuvxL7ZWFjB0ff25TxI93VBu27Pt/pQ4aFJCnzhFGlOBdLH
 e0OAxNVLMuVYSf+9MR0DrcAoetvmuELYA+3IfYTZVCWLGHfQA71j3smeqJVX8epeeWCY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=A+RpFOlEuJHnJX/RXvQgZnIYOIQdsuYlk0HZClr17QI=; b=i
 Wd72KPqm77fJrRhi/NoziCq5qarZSi95a8wDTlDJ/Un8yP1dmmpk27XhsGe4UbCkGB9tMebI3CLFX
 IkR4P/crRxWcGdGJ/m2GG0fBHwxo4SQhNB7WFtkUWEX16aVJ9pcC+khHl4BRM8wICh6CzeGGIau3s
 SXsruOuII/8e3nXk=;
Received: from esa9.hc1455-7.c3s2.iphmx.com ([139.138.36.223])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nQ1wO-0003St-CQ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 04 Mar 2022 07:01:29 +0000
IronPort-SDR: NEqaBTLRVYZQG3kiqY3WislZTlFs5oxlvGgv3iuuUiVmywC0NbhCdUq70FMug2aWxXB37CCLTJ
 /Zg/WAppgyIXUOO6fHkkP222Lwbrp7cKLJ3/FrhEwkB/UHGLWvb2A/sCHwalqfTvQucGpdaMKr
 ed8d4arFfUKRr0TYFfyL6NAPuPgrlnO208TDuauwQB3IuJx+K1t2OH5WH0uko5iSvX4GNKdy2i
 /8rbl/JmkO7MWmucWiH+RT8vNAEqk1MgRwMKwHrdFWxHO37e7BkCido9DwkdZJsB+YwckvNHdP
 onW0lIqeBRj8Bit7YeU6UH2x
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="53090335"
X-IronPort-AV: E=Sophos;i="5.90,154,1643641200"; d="scan'208";a="53090335"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
 by esa9.hc1455-7.c3s2.iphmx.com with ESMTP; 04 Mar 2022 15:45:45 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com
 [192.168.87.59])
 by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 63225D9FCD
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri,  4 Mar 2022 15:45:44 +0900 (JST)
Received: from yto-om2.fujitsu.com (yto-om2.o.css.fujitsu.com [10.128.89.163])
 by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 86E8ABDB28
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri,  4 Mar 2022 15:45:43 +0900 (JST)
Received: from cn-r05-10.example.com (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by yto-om2.fujitsu.com (Postfix) with ESMTP id 7D372403884F7;
 Fri,  4 Mar 2022 15:45:42 +0900 (JST)
From: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
To: linux-arm-kernel@lists.infradead.org, soc@kernel.org,
 linux-serial@vger.kernel.org, sumit.garg@linaro.org
Date: Fri,  4 Mar 2022 15:43:22 +0900
Message-Id: <20220304064324.331217-1-hasegawa-hitomi@fujitsu.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The interrupt is set using pseudo-NMI if it is available.
 Arm has a diagnostic interrupt feature called "Arm Generic Diagnostic Dump
 and Reset device", but the A64FX does not support this feature and [...] 
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [139.138.36.223 listed in list.dnswl.org]
 0.7 SPF_NEUTRAL            SPF: sender does not match SPF record (neutral)
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
X-Headers-End: 1nQ1wO-0003St-CQ
X-Mailman-Approved-At: Fri, 04 Mar 2022 11:38:02 +0000
Subject: [Kgdb-bugreport] [PATCH v2 0/2] soc: fujitsu: Add A64FX diagnostic
 interrupt driver
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
Cc: hasegawa-hitomi@fujitsu.com, daniel.thompson@linaro.org, arnd@arndb.de,
 will@kernel.org, peterz@infradead.org, catalin.marinas@arm.com,
 jason.wessel@windriver.com, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, olof@lixom.net, jirislaby@kernel.org,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The interrupt is set using pseudo-NMI if it is available. Arm has a
diagnostic interrupt feature called "Arm Generic Diagnostic Dump and
Reset device", but the A64FX does not support this feature and instead
has its own device definition.

This patch series includes ones created by Sumit.[1]

I tested on FX700:
$ echo 1 > /proc/sys/kernel/sysrq
$ echo HARDLOCKUP > /sys/kernel/debug/provoke-crash/DIRECT
[  124.712351] lkdtm: Performing direct entry HARDLOCKUP
[  147.232096] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
:
:

Send the "chassis power diag" command from the management server
using ipmitool, the following message is shown:
[  206.061770] sysrq: Trigger a crash
[  206.061779] Kernel panic - not syncing: sysrq triggered crash
:
:

Changes in V2:
 - Include Sumit's patch.
 - The handler calls handle_sysrq() to use the sysrq feature to cause
   a panic.
 - request_nmi() and request_irq() now use the same handler, and
   the function name of the handler has also changed.
 - Use readl()/writel() instead of readl_relaxed()/writel_relaxed().

V1:
  https://lore.kernel.org/linux-arm-kernel/20220218092010.1327309-1-hasegawa-hitomi@fujitsu.com/

[1] https://lore.kernel.org/all/20220228135408.1452882-1-sumit.garg@linaro.org/

Sumit Garg (1):
  tty/sysrq: Make sysrq handler NMI aware

Hitomi Hasegawa (1):
  soc: fujitsu: Add A64FX diagnostic interrupt driver

 MAINTAINERS                      |   5 +
 drivers/soc/Kconfig              |   1 +
 drivers/soc/Makefile             |   1 +
 drivers/soc/fujitsu/Kconfig      |  13 +++
 drivers/soc/fujitsu/Makefile     |   3 +
 drivers/soc/fujitsu/a64fx-diag.c | 151 +++++++++++++++++++++++++++++++
 drivers/tty/sysrq.c              |  45 ++++++++-
 include/linux/sysrq.h            |   1 +
 kernel/debug/debug_core.c        |   1 +
 9 files changed, 220 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/fujitsu/Kconfig
 create mode 100644 drivers/soc/fujitsu/Makefile
 create mode 100644 drivers/soc/fujitsu/a64fx-diag.c

-- 
2.27.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
