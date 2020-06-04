Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC1A1EE1FF
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  4 Jun 2020 12:01:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jgmh9-00025V-0H
	for lists+kgdb-bugreport@lfdr.de; Thu, 04 Jun 2020 10:01:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jgmh8-00025D-48
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Jun 2020 10:01:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Clstppy/1La57TBLOjLA/wXNlzifwjjs+dcuhmyrmaM=; b=EPwcuMwvJYybZ/4+AB2fRdmaau
 Wp+0ish0L3tN/014lStkBue8DGUjTF4iCR41sQAx9Ihp9cFWRrKTnwkZhX5fHlKFrM+f0JKyIfSy1
 nrXnzE8CnwORcCVS6Xwp4uHa4s0cVLBYkPCbRrBpA7IK9YrCh0/Bj9VfNJcBr84+RDVM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Clstppy/1La57TBLOjLA/wXNlzifwjjs+dcuhmyrmaM=; b=RgaZmmd5UcSA+lqMiFKwjfYBpZ
 zpAJoqqQtwSEO+L0oVUR2HKLxw5bjl9DFyxVGzDPcuRqcluz9JxBGVEAYPR0iQ37DPxMTdqNoOv6N
 g20O2n8MtsdpyWoVnkbmXfwentHUk0jQCldfyDCSHXMIlIBHLhnRIghiqPqc7ieL+e/k=;
Received: from mail-pj1-f66.google.com ([209.85.216.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgmgz-005FI2-5h
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Jun 2020 10:01:54 +0000
Received: by mail-pj1-f66.google.com with SMTP id d6so982639pjs.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 Jun 2020 03:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=Clstppy/1La57TBLOjLA/wXNlzifwjjs+dcuhmyrmaM=;
 b=f0FQClfiS3taqRiHZVNQQ/xEoxPu/xT7VUjVZA/dUMwVQlw5oQLsBZsrBsVAMuud5z
 omxOeJKgsRb4M/AiakjwNjFdLagSAb1wYJ3PCu7bAcxesHdFl8zamT89hjwwAiNKGIxI
 bC9/cofrq2DuCMPQTgH5g6pU2zuvUPfgsWx8BHdPZW8loHBAuPwPV3VSQrCuTwYy8JAu
 4VprYlBOiCALNM74NEryhPUfk7bs2b0hjMSbTMxnn9xWNRgYG1pn0fUQaorfVp6gm93h
 kv428ayG3bxzjYwF3E5c+O4VQrm9gfwf59WpXgwq6XLuWfu6UO/w5jM8so1FeVs53wXY
 Mkng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Clstppy/1La57TBLOjLA/wXNlzifwjjs+dcuhmyrmaM=;
 b=QGsaDLbWVSRBj6//A6uo1IK4/JaVycUVk8tKaZpsnw+4/accO48LZivRyI5mckPXWx
 dBNMrN7fx5b924qhLzFZ3UFSveIVRCoTqhSH5ShiNkxbWfwS7yHBlvTgdoJX6dKJ+7zx
 rfhwU5Bd1ePXFscJbNyQZt4SVGUyfW8cyBfuk4Zp76INpnb7+l7PMqs0rWHI2vpQk79j
 6aEXyAlFp/WemQkwTUmOzRlbI4d9/8WUu1mt70V6OWURDWV4DkhXwxL55BtdAbklcTaJ
 pfiqFF5/bD3jDhs8wH/oTTrAo3WyqhMm4uCAewPYnlhufAsjCBJH/HR8CsUBDIDWDiBn
 KhSA==
X-Gm-Message-State: AOAM530SMrXIl3jxBXRG5AoCYT126JHoZdujGbmUfNfTphLJ3kW8tFf2
 4RyrXaaReyNEP2kQF43/o9HH7g==
X-Google-Smtp-Source: ABdhPJzVjymj2KK9Fb597/6EVryJH8miLwm1wthbBL4tfu3R8Prui6WkFEIdRP6KmrRYYgDI9FEmfw==
X-Received: by 2002:a17:90a:5aa4:: with SMTP id
 n33mr5297644pji.226.1591264899492; 
 Thu, 04 Jun 2020 03:01:39 -0700 (PDT)
Received: from localhost.localdomain ([117.252.66.248])
 by smtp.gmail.com with ESMTPSA id np5sm5786992pjb.43.2020.06.04.03.01.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jun 2020 03:01:38 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: daniel.thompson@linaro.org
Date: Thu,  4 Jun 2020 15:31:15 +0530
Message-Id: <1591264879-25920-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.66 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jgmgz-005FI2-5h
Subject: [Kgdb-bugreport] [PATCH v6 0/4] kdb: Improve console handling
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
Cc: pmladek@suse.com, kgdb-bugreport@lists.sourceforge.net,
 jason.wessel@windriver.com, linux-kernel@vger.kernel.org,
 sergey.senozhatsky@gmail.com, gregkh@linuxfoundation.org, jslaby@suse.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

This patch-set is aimed to improve console handling especially when kdb
operates in NMI context.

Brief description of enhancements:
- Add status check for console prior to invoking corresponding handler.
- Fixup to avoid possible deadlock in NMI context due to usage of locks
  in the console handlers.
- Prefer usage of polling I/O driver mode (lockless APIs) over invocation
  of console handlers.

Changes in v6:
- Replace early_con -> kgdboc_earlycon_io_ops.cons.
- Added Petr's review tag on patch #1, #2 and #3.
- Drop Doug's review tag from patch #4 due to early_con changes which I
  think needs a re-review.

Changes in v5:
- Rebased on top of tags/kgdb-5.8-rc1.
- Get rid of kdb_io_write().
- Fixed issue reported by kbuild test robot.
- Remove is_console from kgdboc_earlycon_io_ops as well.
- Misc. comments.
- Added Doug's review tag.

Changes in v4:
- Use dbg_io_ops->write_char() directly instead of passing it as a
  function pointer.
- Use "struct console" rather than "struct tty_driver" for comparison.
- Make commit descriptions and comments more informative.
- Add review tag for patch #2.

Changes in v3:
- Split patch to have separate patch for console status check.
- New patch to re-factor kdb message emit code.
- New patch to prefer polling I/O over console mode.
- Add code comments to describe usage of oops_in_progress.

Changes in v2:
- Use oops_in_progress directly instead of bust_spinlocks().

Sumit Garg (4):
  kdb: Re-factor kdb_printf() message write code
  kdb: Check status of console prior to invoking handlers
  kdb: Make kdb_printf() console handling more robust
  kdb: Switch to use safer dbg_io_ops over console APIs

 drivers/tty/serial/kgdb_nmi.c |  2 +-
 drivers/tty/serial/kgdboc.c   | 32 +++++++++----------
 drivers/usb/early/ehci-dbgp.c |  3 +-
 include/linux/kgdb.h          |  5 ++-
 kernel/debug/kdb/kdb_io.c     | 72 ++++++++++++++++++++++++++-----------------
 5 files changed, 64 insertions(+), 50 deletions(-)

-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
