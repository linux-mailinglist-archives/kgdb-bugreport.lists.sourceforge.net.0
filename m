Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 004BD1ECA69
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Jun 2020 09:22:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jgNjZ-0007Bq-PI
	for lists+kgdb-bugreport@lfdr.de; Wed, 03 Jun 2020 07:22:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jgNjY-0007Bi-Os
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 07:22:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sFHwcYSPIAh2Jj0qa/cpOPKVZENd3AGMzBBQqYwi8fI=; b=iq+esER9vUXfnkeR6Pfob8V3Fv
 qN5NlNazun8+/Sey4HiaiPwbHgMwlowxw3bGeq859QjslBDLjg5IIO+XIUaobW3gFotbJ8rwIj5CR
 g9/KVe+w7JhWAjpUe8tcDgMRY0iEX92/gY/c0TytL7qWtuxYaDQu+RPy1XGtwf6zfIn4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sFHwcYSPIAh2Jj0qa/cpOPKVZENd3AGMzBBQqYwi8fI=; b=e5bkGayZZZy0EbABLsPQtUi2tO
 xvN2uvI+WYjkeqnAMjRXwRMSXLLO7srQZYaHtD1cif+zMsHNavywlT5vvBeYseIsmJznf84AERVdI
 V/EqvTUVNDdWUSGP6W7MKaEswmd/rZIHEEMHuLc9S0AsJK6KVo59ShUVSXuWV7uSmsSE=;
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgNjU-003bBx-A8
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 07:22:44 +0000
Received: by mail-pg1-f194.google.com with SMTP id w20so1149562pga.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 03 Jun 2020 00:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=sFHwcYSPIAh2Jj0qa/cpOPKVZENd3AGMzBBQqYwi8fI=;
 b=qZkL/mXJwIrnssnR3nwvS3ogWwJlwkBYYLFqCM55iFXgsyN7HTcPXZUnnPva+TApSP
 bA7x95Rvwp4TX/juPI2tBvWmKu5YF3jxWj/gSA58Lr7mHnqWVYVdNgJhn6nE3o8Ecfwr
 npProNTKjX/dsjTkgGDDvqTHTqoyhLRBIErCIUSRLB2werNOi08K4tcchexeQ8f1471y
 f1YNmAy/Rio8g/eW0AJCxZUvtyW3fCbR2hPzNOI6klOs66EInWZMwShTRclGqgqOGLg8
 Mh3WWS0EMOYFeTVkywYELtS4khgEN4MsB/rWhXIR/pt5DjaG3AD/7ke852VtjS41H0fb
 aZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=sFHwcYSPIAh2Jj0qa/cpOPKVZENd3AGMzBBQqYwi8fI=;
 b=smGaU8El2Wamyu4JQcH0udTc0nykQffiQlBIeJosfu3Ygkzn+zxVk6XaxhWZzSUu3o
 VIbKckQgVbDs3go/L0oXdJkwVIJaw30+tf4ceTXFgafLehEjsTzZhneBXH/d6dYuJzk7
 TK4JTQcxPqYVCSXhXP1yj5t9blSIpwH8PXxqJQpr7hHvHfjS7S0rTrpJBJCh22mazWDs
 7FPxSsQ9W61N4gyQYnkmCkfG5X+BYMFqVdzADSdrCpEbgyucgvT5EA71HiOB1glzoH/1
 z5oZl/8N3I8ooP4Agwz4KMrN4rCMiBrZMUYJc0X2uPBcQzJhGCPwDYe0cTwyZSYghgV7
 vr8g==
X-Gm-Message-State: AOAM533tijay3tGvph0D6HGn/clCVIWg4CykZgY5FoCM9mbppttSzmME
 tjmG9+hpk4yz5QsOv1EowNQHSg==
X-Google-Smtp-Source: ABdhPJzYrtSuBzWBxQeHuhyPGoIWSMJmm2YZ33qvTuLmq1Kfeq7Iqz/43WDaMW+sx+et84376Qck9g==
X-Received: by 2002:a63:4c1f:: with SMTP id z31mr26862932pga.143.1591168954526; 
 Wed, 03 Jun 2020 00:22:34 -0700 (PDT)
Received: from localhost.localdomain ([117.252.66.248])
 by smtp.gmail.com with ESMTPSA id j17sm1407272pjy.22.2020.06.03.00.22.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jun 2020 00:22:33 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: daniel.thompson@linaro.org
Date: Wed,  3 Jun 2020 12:52:11 +0530
Message-Id: <1591168935-6382-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jgNjU-003bBx-A8
Subject: [Kgdb-bugreport] [PATCH v5 0/4] kdb: Improve console handling
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
 drivers/tty/serial/kgdboc.c   |  6 ++--
 drivers/usb/early/ehci-dbgp.c |  3 +-
 include/linux/kgdb.h          |  5 ++-
 kernel/debug/kdb/kdb_io.c     | 72 ++++++++++++++++++++++++++-----------------
 5 files changed, 51 insertions(+), 37 deletions(-)

-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
