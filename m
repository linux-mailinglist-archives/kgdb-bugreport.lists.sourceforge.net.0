Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC64D1DB156
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 20 May 2020 13:18:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jbMkF-0003JG-HC
	for lists+kgdb-bugreport@lfdr.de; Wed, 20 May 2020 11:18:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jbMkE-0003Iz-EM
 for kgdb-bugreport@lists.sourceforge.net; Wed, 20 May 2020 11:18:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=05sWOFK6tuBIdg0teEFyYCPt+cVyW+PqgkCyuRv1w18=; b=XgqsFgK6wlYjsnY2orFv801zLr
 9PcE6HA9bNYCHiEDHnTfE74597UrYKEmY+semSdWnId5Ez2moLML961tebqdSLjFJsTjxHrg4ohjM
 Wwt3VLQC3siIZECtl+CHkDjNGeIcEN7g3HOYNo2wBekmAtp8OclWGMMDwZ+N6LZazBbw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=05sWOFK6tuBIdg0teEFyYCPt+cVyW+PqgkCyuRv1w18=; b=YaDFwYU9/LXgkt9VLN3VLrfJic
 4BeLiizMl20GvAvx7Wly2KwjVDSnVsQnjJ3lkHT58pDsm16WX+sq0hBgi0jcWDooCR4k8RF3zrJtQ
 illnKvwwZIwRga9MTOqmn62uUlGxD/DjqjdFpJZTe3RZYZuirZaUAfKH9D5N4KZXO32A=;
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbMk9-001yYB-NV
 for kgdb-bugreport@lists.sourceforge.net; Wed, 20 May 2020 11:18:42 +0000
Received: by mail-oi1-f193.google.com with SMTP id o24so2612468oic.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 20 May 2020 04:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=05sWOFK6tuBIdg0teEFyYCPt+cVyW+PqgkCyuRv1w18=;
 b=TqVjp5354l9g1YsMnmiLHIjXurzKyt9dZu9rMhX+qNabLlTNIE6ll/SK69p9ELSwHb
 HuIDMQdB8adG6bsECZCVjF6ESjyXInN9zVRWoK7m76v6WmBTs2VR4Ky643jLAM6gh8Q9
 vJZzAU8MIsFMiG+WKtswEPNgfgeXmkv2k31LT6AXPJobmw8gSC4EGJXHXV/zZLSc7kjQ
 j9M5acva6zU2GvPjWKZiCWaPnNNwDNV79FzECZ+56c5USFDAg0hizjdw23llsucwhdRY
 o5Tg2VeRzxBngmGYQOCf9DrCKdUGxO6/Bu5iH1ApiTirZU7ZQ1blBuRj4Wi/anElVBX/
 BidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=05sWOFK6tuBIdg0teEFyYCPt+cVyW+PqgkCyuRv1w18=;
 b=Da+Yj8heEgXhNk/lctA34kOmfnrcYcf/gLdCwBU6kD0ICz51ZIKmXOTCcbgzh2hiwd
 yWxZdR9l9NU2LOjvnFaed1CRX0j0iDf0i7xBvHwouyKbe468ia5Y8Z4X5YUd2igkCgXS
 LZbZalZc/FxIeGKrJg8A9NXm1llLJlAcLVJrHt+GwoEmR8a0Z5NyXa85c3l85/TaHw+X
 28QbN/iMVmnVNNALZCIBGAlJ7ShpSIP7HFmSLGaMieD4jYNjx2q86yGb+RQGigkjcAyc
 qHbSdcUiZmkLhaizhOxDljy/+6eg0qlRzV373S/JNORpOIytPasGUghI/K41Ajv6uZII
 cBOg==
X-Gm-Message-State: AOAM5325vYUWv1J8kfk+v2kBRsH+pjyeCQIaKy5o0RAn51SsRGNu0waL
 fNs39SrZ6A0ykxZP6ubgKWkoifUwLgA=
X-Google-Smtp-Source: ABdhPJyaLwGf8TIiu+2wsx2Qxt0RIooE9jEihzhPvu8Fjah7GhQsku+h9APnrXOZSyeJeeClHe/oVQ==
X-Received: by 2002:a17:90a:4d4a:: with SMTP id
 l10mr4851457pjh.0.1589973161858; 
 Wed, 20 May 2020 04:12:41 -0700 (PDT)
Received: from localhost.localdomain ([117.252.68.136])
 by smtp.gmail.com with ESMTPSA id q134sm2044974pfc.143.2020.05.20.04.12.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 May 2020 04:12:40 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: linux-arm-kernel@lists.infradead.org
Date: Wed, 20 May 2020 16:41:51 +0530
Message-Id: <1589973115-14757-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.193 listed in list.dnswl.org]
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jbMk9-001yYB-NV
Subject: [Kgdb-bugreport] [PATCH v2 0/4] arm64: Introduce new IPI as
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
Cc: daniel.thompson@linaro.org, jason@lakedaemon.net, catalin.marinas@arm.com,
 jason.wessel@windriver.com, linux-kernel@vger.kernel.org, maz@kernel.org,
 kgdb-bugreport@lists.sourceforge.net, tglx@linutronix.de, will@kernel.org,
 julien.thierry.kdev@gmail.com
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
<snip>

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

 arch/arm64/include/asm/hardirq.h |  2 +-
 arch/arm64/include/asm/kgdb.h    |  8 +++++++
 arch/arm64/include/asm/smp.h     |  1 +
 arch/arm64/kernel/kgdb.c         | 21 +++++++++++++++++
 arch/arm64/kernel/smp.c          | 49 ++++++++++++++++++++++++++++++++--------
 drivers/irqchip/irq-gic-v3.c     | 13 +++++++++--
 6 files changed, 81 insertions(+), 13 deletions(-)

-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
