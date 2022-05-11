Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF0B522C6C
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 11 May 2022 08:37:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nofyZ-0004WN-1U
	for lists+kgdb-bugreport@lfdr.de; Wed, 11 May 2022 06:37:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hasegawa-hitomi@fujitsu.com>) id 1nofyX-0004WH-KF
 for kgdb-bugreport@lists.sourceforge.net; Wed, 11 May 2022 06:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c5rEu+JhhuuapOkOryoKi9v1Sylz5z9zap4h2C5HrVs=; b=abel6R+SsHtk0Cp8cWI1ZBChM1
 K6tyzP34h6oOgonOmfDBox+g9/VF/MYWMIHyD0LEo+0GRfO9Z2JJRVSZZfUnk/7flvBpMV01i0Hfw
 0Zd0+qP8pgupP6RUnBhCg5xlixUbYYquXvW5I2iQiK0So/Q/AIoCJIxSbJmE3fvd/XUY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=c5rEu+JhhuuapOkOryoKi9v1Sylz5z9zap4h2C5HrVs=; b=Q
 IM14hEKS0rJPBFCisp6UWqUPf/kuIIOYOU74i/es4hy+mTGEw1qYp0lPWrwyD1ZfPNV51erNc1DgU
 kKbavms3/B/6k1XeE0ncZdwZRf7GhuSZ9KKAxemm5tsOVGaZdLxyWZh2AcPvfgjjNNAcI2rL3MKyy
 Y/xZJemHO3qvPH6k=;
Received: from esa7.hc1455-7.c3s2.iphmx.com ([139.138.61.252])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nofyR-008XSO-Gp
 for kgdb-bugreport@lists.sourceforge.net; Wed, 11 May 2022 06:37:31 +0000
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="51186268"
X-IronPort-AV: E=Sophos;i="5.91,216,1647270000"; d="scan'208";a="51186268"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
 by esa7.hc1455-7.c3s2.iphmx.com with ESMTP; 11 May 2022 15:21:40 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com
 [192.168.83.64])
 by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4430BC9442
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 11 May 2022 15:21:40 +0900 (JST)
Received: from oym-om1.fujitsu.com (oym-om1.o.css.fujitsu.com [10.85.58.161])
 by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7AB95D05F2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 11 May 2022 15:21:39 +0900 (JST)
Received: from cn-r05-10.example.com (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by oym-om1.fujitsu.com (Postfix) with ESMTP id 4078940487F9C;
 Wed, 11 May 2022 15:21:39 +0900 (JST)
From: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
To: linux-arm-kernel@lists.infradead.org, soc@kernel.org,
 linux-serial@vger.kernel.org, sumit.garg@linaro.org
Date: Wed, 11 May 2022 15:21:12 +0900
Message-Id: <20220511062113.2645747-1-hasegawa-hitomi@fujitsu.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The interrupt is set using pseudo-NMI if it is available.
 Arm has a diagnostic interrupt feature called "Arm Generic Diagnostic Dump
 and Reset device", but the A64FX does not support this feature and [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [139.138.61.252 listed in list.dnswl.org]
 0.7 SPF_NEUTRAL            SPF: sender does not match SPF record (neutral)
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nofyR-008XSO-Gp
Subject: [Kgdb-bugreport] [PATCH v4 0/1] soc: fujitsu: Add A64FX diagnostic
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

I tested on FX700:
$ echo 1 > /proc/sys/kernel/sysrq
$ echo HARDLOCKUP > /sys/kernel/debug/provoke-crash/DIRECT
:
:

Send the "chassis power diag" command from the management server
using ipmitool, the following message is shown:
[  123.272342] Kernel panic - not syncing: a64fx_diag: interrupt received
:
:

Changes in V4:
 - Call the panic function instead of sysrq. Prepare a handler
   for each NMI/IRQ and call nmi_panic()/panic() respectively (as in v1).
 - Fixing other issues raised by Greg.

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

V3: https://lore.kernel.org/linux-arm-kernel/20220331092235.3000787-1-hasegawa-hitomi@fujitsu.com/
V2: https://lore.kernel.org/linux-arm-kernel/20220304064324.331217-3-hasegawa-hitomi@fujitsu.com/
V1: https://lore.kernel.org/linux-arm-kernel/20220218092010.1327309-1-hasegawa-hitomi@fujitsu.com/


Hitomi Hasegawa (1):
  soc: fujitsu: Add A64FX diagnostic interrupt driver

 MAINTAINERS                      |   5 +
 drivers/soc/Kconfig              |   1 +
 drivers/soc/Makefile             |   1 +
 drivers/soc/fujitsu/Kconfig      |  13 +++
 drivers/soc/fujitsu/Makefile     |   3 +
 drivers/soc/fujitsu/a64fx-diag.c | 155 +++++++++++++++++++++++++++++++
 6 files changed, 178 insertions(+)
 create mode 100644 drivers/soc/fujitsu/Kconfig
 create mode 100644 drivers/soc/fujitsu/Makefile
 create mode 100644 drivers/soc/fujitsu/a64fx-diag.c

-- 
2.27.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
