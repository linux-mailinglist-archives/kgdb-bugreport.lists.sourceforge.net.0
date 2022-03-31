Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7A24ED722
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 31 Mar 2022 11:41:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nZrIu-0000Xu-Kc
	for lists+kgdb-bugreport@lfdr.de; Thu, 31 Mar 2022 09:41:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hasegawa-hitomi@fujitsu.com>) id 1nZrIt-0000Xn-6E
 for kgdb-bugreport@lists.sourceforge.net; Thu, 31 Mar 2022 09:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zMlhShqHtzVWbDj/VZGc5LIrN6f4FYhdEjVwAre8mOA=; b=asrbpCNWojL5SldFv0Foz+lvCL
 r6U+mJBhgmLxdo3fMIYzd4nHri9GTuYalu8T9mmbNlf4W/IdwQdNfCzvJm/noV3pXkCQinHegoUY5
 FCcUpevbLFzJMyEM+3uSRxDxbHI/lRmNqBfBHK6y3re+HL55WkiFxv0RteN/nPWeRdMQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zMlhShqHtzVWbDj/VZGc5LIrN6f4FYhdEjVwAre8mOA=; b=n
 Oukx1dTEfVZhU3qka70bJkfiX7ihqCDzS4LNztZsjPp766HZ84yHOXTumitACGfXZ5sztpsCFIsnq
 mAX8kfC/X66oTlKh4BKBxsIjK1dNYN9XeSEyxkAOJlNnR25gEtI0Db45fPa9AuoKMmANGEOMS7caX
 5WAIRfHGsxO+6X9A=;
Received: from esa11.hc1455-7.c3s2.iphmx.com ([207.54.90.137])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nZrIo-0007QH-Sr
 for kgdb-bugreport@lists.sourceforge.net; Thu, 31 Mar 2022 09:41:17 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="47665236"
X-IronPort-AV: E=Sophos;i="5.90,224,1643641200"; d="scan'208";a="47665236"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
 by esa11.hc1455-7.c3s2.iphmx.com with ESMTP; 31 Mar 2022 18:25:29 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com
 [192.168.83.64])
 by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CAD68CD6C0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 31 Mar 2022 18:25:28 +0900 (JST)
Received: from yto-om3.fujitsu.com (yto-om3.o.css.fujitsu.com [10.128.89.164])
 by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 17DD2D0922
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 31 Mar 2022 18:25:27 +0900 (JST)
Received: from cn-r05-10.example.com (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by yto-om3.fujitsu.com (Postfix) with ESMTP id 3B74C400C07B8;
 Thu, 31 Mar 2022 18:25:26 +0900 (JST)
From: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
To: linux-arm-kernel@lists.infradead.org, soc@kernel.org,
 linux-serial@vger.kernel.org, sumit.garg@linaro.org
Date: Thu, 31 Mar 2022 18:22:34 +0900
Message-Id: <20220331092235.3000787-1-hasegawa-hitomi@fujitsu.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
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
 medium trust [207.54.90.137 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.7 SPF_NEUTRAL            SPF: sender does not match SPF record (neutral)
X-Headers-End: 1nZrIo-0007QH-Sr
Subject: [Kgdb-bugreport] [PATCH v3 0/1] soc: fujitsu: Add A64FX diagnostic
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

This patch series assumes that Sumit's patch has been patched.[1]

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

Changes in V3:
 - Exclude Sumit's patch.
 - Retest in v5.17.

Changes in V2:
 - Include Sumit's patch.
 - The handler calls handle_sysrq() to use the sysrq feature to cause
   a panic.
 - request_nmi() and request_irq() now use the same handler, and
   the function name of the handler has also changed.
 - Use readl()/writel() instead of readl_relaxed()/writel_relaxed().

[1] https://lore.kernel.org/all/20220307110328.2557655-1-sumit.garg@linaro.org/
V2: https://lore.kernel.org/linux-arm-kernel/20220304064324.331217-3-hasegawa-hitomi@fujitsu.com/
V1: https://lore.kernel.org/linux-arm-kernel/20220218092010.1327309-1-hasegawa-hitomi@fujitsu.com/


Hitomi Hasegawa (1):
  soc: fujitsu: Add A64FX diagnostic interrupt driver

 MAINTAINERS                      |   5 +
 drivers/soc/Kconfig              |   1 +
 drivers/soc/Makefile             |   1 +
 drivers/soc/fujitsu/Kconfig      |  13 +++
 drivers/soc/fujitsu/Makefile     |   3 +
 drivers/soc/fujitsu/a64fx-diag.c | 151 +++++++++++++++++++++++++++++++
 6 files changed, 174 insertions(+)
 create mode 100644 drivers/soc/fujitsu/Kconfig
 create mode 100644 drivers/soc/fujitsu/Makefile
 create mode 100644 drivers/soc/fujitsu/a64fx-diag.c

-- 
2.27.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
