Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A24521B72BD
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 24 Apr 2020 13:11:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jRwF3-0007GN-F2
	for lists+kgdb-bugreport@lfdr.de; Fri, 24 Apr 2020 11:11:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jRwF2-0007GG-A9
 for kgdb-bugreport@lists.sourceforge.net; Fri, 24 Apr 2020 11:11:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C9PN16nlCbR73t00paMo9AAcjhtW4HbAszJmaJCFe6s=; b=gKNJrJ96uP7beqRzHBqFfYxPdL
 Ni9fxrpXhlGlnltyIA+y1vbSbinBu8mAETMJYEubs+VonDWmX/Db6AeNdd1R2k7cywyDTgqT02Vm9
 WR5SWF4LVbl1mY5dKqVynMf/gQ2Ez/jegXDBtYMYkl2ZqQt08r2covylSMfsE+A8xWoU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C9PN16nlCbR73t00paMo9AAcjhtW4HbAszJmaJCFe6s=; b=YUbyrfP4ObN2P40l5A4e8HRtXn
 4o4St43w4ce3iR66r0Zea/2iwo6n3izxA4mjbvs+Z46VtXkn6qnvJjDhnYjGKG5shIS/qyFCCKZVj
 GUzi15w3SXk+TDuWRpBBTZbtgH64d7jPx+sgpAYosv83ux/DAA+M+A1Qcn7xXlfUjSak=;
Received: from mail-pj1-f68.google.com ([209.85.216.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jRwEx-00CU8i-MH
 for kgdb-bugreport@lists.sourceforge.net; Fri, 24 Apr 2020 11:11:32 +0000
Received: by mail-pj1-f68.google.com with SMTP id fu13so3185660pjb.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 24 Apr 2020 04:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=C9PN16nlCbR73t00paMo9AAcjhtW4HbAszJmaJCFe6s=;
 b=lpliri/AOX1NKMV8T3cDtg94yI7PnQd3PoHBB7izJ05O3YNMrdp87cyKPoXoul1D2f
 GCDlSJpkivh7ZAXeOL5+rieJcE2DNN9iSZPIxLwZZVb+Qm3cbkQKJARpNBDhSn441Q3k
 EE/DwBZRapV8OrmjMMahX2q9Y0C4WMpX4hk69nu8xDguJ6RnB84CQH3MXOlLLg92wKDl
 Fb9TyMBzSej64Cl/TybB54K5NSjpfto9P+n7ojlR/5puv/zZibU+fu7Xw5J6BL+3Rqro
 Ug6iJYH3OeR6FNDoawewxo7/oN7WxIsHlFiqoKkwXBrWxLRU4Nn1LOjl8yBF9g1jLSa6
 /m4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=C9PN16nlCbR73t00paMo9AAcjhtW4HbAszJmaJCFe6s=;
 b=AcMKfGkqPY5+Jf8e2TVTxHgcXJ4mmvAXOOQ81n5FX/OLY79Okixwq3LEMozKPV1I6t
 zg8nb+DMVnYKVtY6GkDX6tdiFWIgSaOFNvQg0mjqzdMh66WwjSQZJ+M6zGhpMBAQyw0w
 QCeCqetw43BsFyVEnMcS/crYsgW9rGAVwloJl+kDc3Ds6m4bngCpq5uwylxVpUkUV3EQ
 9RBDyNYIU2B5IQDyvY4d1fFzz9wWB5mRvffV1hHVtQUDz7W4FTREMZt+w5v+mXP3uY2V
 098hF3xTFLYjC1UV6ZflaUbaLdhGeQLDWsSphnZgKVooEfHLNiD8XceKQjqIoQJksCUj
 yk2w==
X-Gm-Message-State: AGi0Pub0UsllUeqnr2pQgnpiwptl+Kbg/hMBHq1eTX8YHhLJz7f/Axsa
 NFvDPUK3dPQDYRYuH5LJhOi9Vw==
X-Google-Smtp-Source: APiQypJRiNBG/TsX5FoVn/NIsUMUkt59D0Cs90C2+w+JS9ApTI5yokyp2gpBXnHP+0nU4wDjA7zGYQ==
X-Received: by 2002:a17:90a:f995:: with SMTP id
 cq21mr5615679pjb.56.1587726681811; 
 Fri, 24 Apr 2020 04:11:21 -0700 (PDT)
Received: from localhost.localdomain ([117.252.71.186])
 by smtp.gmail.com with ESMTPSA id o11sm4637628pgd.58.2020.04.24.04.11.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Apr 2020 04:11:20 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: linux-arm-kernel@lists.infradead.org
Date: Fri, 24 Apr 2020 16:39:10 +0530
Message-Id: <1587726554-32018-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.68 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jRwEx-00CU8i-MH
Subject: [Kgdb-bugreport] [RFC Patch v1 0/4] arm64: Introduce new IPI as
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
btc: cpu status: Currently on cpu 11
Available cpus: 0-10(I), 11, 12(I), 13, 14-23(I)
<snip>
Stack traceback for pid 623
0xffff00086a644600      623      622  1   13   R  0xffff00086a644fc0  bash
CPU: 13 PID: 623 Comm: bash Not tainted 5.7.0-rc2 #27
Hardware name: Socionext SynQuacer E-series DeveloperBox, BIOS build #73 Apr  6 2020
Call trace:
 dump_backtrace+0x0/0x198
 show_stack+0x18/0x28
 dump_stack+0xb8/0x100
 kgdb_cpu_enter+0x5c0/0x5f8
 kgdb_nmicallback+0xa0/0xa8
 handle_IPI+0x190/0x200
 gic_handle_irq+0x2b8/0x2d8
 el1_irq+0xcc/0x180
 lkdtm_HARDLOCKUP+0x8/0x18
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

Looking forward to your comments/feedback.

Sumit Garg (4):
  arm64: smp: Introduce a new IPI as IPI_CALL_NMI_FUNC
  irqchip/gic-v3: Add support to handle SGI as pseudo NMI
  irqchip/gic-v3: Enable arch specific IPI as pseudo NMI
  arm64: kgdb: Round up cpus using IPI_CALL_NMI_FUNC

 arch/arm64/include/asm/hardirq.h |  2 +-
 arch/arm64/include/asm/smp.h     |  1 +
 arch/arm64/kernel/kgdb.c         | 15 +++++++++++++++
 arch/arm64/kernel/smp.c          | 36 +++++++++++++++++++++++++++++++++++-
 drivers/irqchip/irq-gic-v3.c     | 36 +++++++++++++++++++++++++++++++-----
 5 files changed, 83 insertions(+), 7 deletions(-)

-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
