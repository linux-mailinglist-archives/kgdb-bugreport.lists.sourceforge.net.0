Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A27FA1E7BB1
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 29 May 2020 13:27:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jedAf-0005Zt-Ai
	for lists+kgdb-bugreport@lfdr.de; Fri, 29 May 2020 11:27:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jedAe-0005ZZ-7z
 for kgdb-bugreport@lists.sourceforge.net; Fri, 29 May 2020 11:27:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x3d4hVCjjVp2AvYrfQexVhqf97WQTWR6EO5yWpa4vpw=; b=iYJUM70gLjOlRU0AnlVWVDb+9N
 SCYV5magE9/WopizitgX2MCUQF3bgSSTm9czcgHtRWaiULKKlFkjqutBWGsihkzHoYR1a5MWLFuga
 CxHbURnXIX2tieOSLko43+ydc4Aoc8ze0k5OjHBUBGjs7JOUlpLo18ePbjHU7B+LuBnI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x3d4hVCjjVp2AvYrfQexVhqf97WQTWR6EO5yWpa4vpw=; b=SRGyZbjf8ApOObFmN69gA+XTO8
 HJhVIMuZ6sDoWltGR6YPDtjvosAWUyVyoJSupXwJ+phIm0SYMkydEqOrAIwa+Wzwsgwsj9+04TZVd
 He9/VH1U/YpakuRPVvNYaB6FGCPPg3ZdmYRkAu+s5NG6ujCvxqNiA16ne7Yj2pNlUSmY=;
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jedAZ-002d2C-7B
 for kgdb-bugreport@lists.sourceforge.net; Fri, 29 May 2020 11:27:28 +0000
Received: by mail-pg1-f196.google.com with SMTP id p30so1359921pgl.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 29 May 2020 04:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=x3d4hVCjjVp2AvYrfQexVhqf97WQTWR6EO5yWpa4vpw=;
 b=Rq040eb8C4b2UxywVlI6/jO3R/CgcFFExt5NFZ64qhrUzY7GO2Et+A8WhUXnPhqTVp
 8Jhpplvkks9SV0f03ucleVTqvKvawIgRXjMfvl86+sr4bc5HZQUuc9LstDvkEA8ps4Sx
 V4ZR+1RMHvZSWSLhQSDxDFm+daleqV2OSSq918hJnCmgcEuQV2Hc6m7CJVg8uWetsI7b
 WeyIICuHwIR0LqQBjpPInzls4+NDEjXaRpOkWxaSzgf+FTE/B2JsLWX3MLlhVjj+J5A6
 atYJVS/9+ZRdI5XRsO2jfXAO+1GFdjs2UlZQfN8TPsdoum7NZJN2DHghiPlel/3Qb50y
 jYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=x3d4hVCjjVp2AvYrfQexVhqf97WQTWR6EO5yWpa4vpw=;
 b=JiqRv9RodKLZkvl6Kj+N6hfk7sRCfRMABaxsx6hKpmVNsC7dl/Aqkjh7Hk4yKXECY5
 RERm8mrqkgXEtNLvOFUOA1GriYwqoKfaE7/t+YyiSXB65eD9DsniS1KTbq97PZX5nPPJ
 AwtxO9km/E+elQOQgGnbH7GItuT+04aRpcCGcpTlss8y40OJe5JKMQrRXOYvdvc8RH2Y
 eDcrTNViTXJgYGkTvG0Od3r1Jow1MUKCIyZEQduyj1dDtfWAREvW75IQPWViW+xJS+pR
 lPhuS5l1iHmP/JLTd/Ed50kbq0X4hq8JFibHQpOGqWoijtRxNsDcCE6WKUV0sRj+WLPm
 D4jA==
X-Gm-Message-State: AOAM531tIzTi1upGB9O86vKVIV0+Dkh+Tes9OM1Cz1hnj/i1GP6Yp32R
 gWGtxTDqHK+zS+lX/XeiO2gh6g==
X-Google-Smtp-Source: ABdhPJy19feXmap0+eOpojGz3t6vUt0qopVefyZXmXVZebcX+FlcE+cEWxrVBK1pU5+KTGOoJwS8ZA==
X-Received: by 2002:a63:5f11:: with SMTP id t17mr7604547pgb.177.1590751637544; 
 Fri, 29 May 2020 04:27:17 -0700 (PDT)
Received: from localhost.localdomain ([117.252.66.248])
 by smtp.gmail.com with ESMTPSA id w190sm7016741pfw.35.2020.05.29.04.27.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 May 2020 04:27:16 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: daniel.thompson@linaro.org
Date: Fri, 29 May 2020 16:56:43 +0530
Message-Id: <1590751607-29676-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jedAZ-002d2C-7B
Subject: [Kgdb-bugreport] [PATCH v4 0/4] kdb: Improve console handling
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
 drivers/tty/serial/kgdboc.c   |  4 +--
 drivers/usb/early/ehci-dbgp.c |  3 +-
 include/linux/kgdb.h          |  5 ++-
 kernel/debug/kdb/kdb_io.c     | 76 ++++++++++++++++++++++++++-----------------
 5 files changed, 54 insertions(+), 36 deletions(-)

-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
