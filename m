Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5595E37F6D5
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 13 May 2021 13:34:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lh9c8-0002PQ-8L
	for lists+kgdb-bugreport@lfdr.de; Thu, 13 May 2021 11:34:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1lh9bz-0002Op-BF
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 May 2021 11:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3e5v4xpnkSIXUPVBTFRMeaXzgMFdRaxBbtf5FiuvHJU=; b=ID1q/W4JZYPfq2aUgAsgxIEt6p
 DSm9sqQqJOjkBsuESxX7iEz9N5Lqw3XQaT4pGTTY7FdvAvmXbO8UZjWxc92mEvYouTU9zJCUgC9MR
 Cd9RkuwOzgkc2Q8tnJUyfXCu1KiBQoZGM87Yr48Fvj8witirzmvWtuMqHzmguZjgx9uA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3e5v4xpnkSIXUPVBTFRMeaXzgMFdRaxBbtf5FiuvHJU=; b=V
 VmWMs27nVFOyWNp2CjDkk/11xvAZC8jT6eK4h09u5ORxE3AG0DivAs9TE42u3QZAlFp1rP/exI7Km
 7p7d3RUqZWR29EbeUqnpo30198ODasTad25KEedRnIOFfs12+AeMCn+nuVLnHn7WCkI9j7W1Zyk0Q
 UeP23N0GsaLLuxR8=;
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lh9bq-0001NS-GD
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 May 2021 11:34:40 +0000
Received: by mail-oi1-f174.google.com with SMTP id u144so451228oie.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 13 May 2021 04:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3e5v4xpnkSIXUPVBTFRMeaXzgMFdRaxBbtf5FiuvHJU=;
 b=HyYqjMT/ljXc7hZMpSLyjtsuNGZh2jsqXON7U/nS3LDGimuUjB8l2mSo7bMMaTe4va
 llgxNKJh/PwhA1G3VjY7n+os3OmHmpeTcMq+pitxRBd1CYUHxqq0UGmfYUe/iis22ukZ
 43p4DISxlRUntQ0DX41UZJSYeuOROkKldMST//mvE9s8h08cLBwFtYW8iL0U/UeBjBJ2
 t/HP0JIwwNtYnav1RXVXfqjC5Jgy1yGqPudWNK+YRFPL8j/I2nx98ErizyPEOt/lONJW
 W067NZeE/1ffUQKOpbPmbqAJVQ970kFuONwUCuE172cfcHlTTlKZKpwpUg8n9IQ4ponI
 Szlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3e5v4xpnkSIXUPVBTFRMeaXzgMFdRaxBbtf5FiuvHJU=;
 b=BemPITl/R4CNyAAUD3Ab/KFMlEWRM4FRaaKL627/Wjq3KjaY8PgFTGzQUwGVZ3WDh2
 wkBiTM9MsZT/OOCD+STiSWKaecvQhVrMkXbJLXNHcvUrJtl0iaEccQsKh5u2Un8dg9fq
 +spUs7uQPGOaPW3N29ZYciRlGK1jt8eLMzs1LONgsSsz7OfHBoYIm3WPPImZHIBgvXhN
 QMaJm/+ZUp+ozCpE9oPzt5OKVUSq1OQacqnaWl5Zl3XtxB7wQrvoNoPUo95mog+G5zgR
 5uI+6gn8L1Bh23UQOpz5ANem7PZgozEVL9aw0jJZ6io5eL4gTbhxJ8DEQfI91vNNeS4o
 bqcQ==
X-Gm-Message-State: AOAM531z1oy1ShJkA0M3MGa1d8n0e6xt1dsV2Bgu+LBbiVLAF+ubtI3Q
 5Zge+9jUtgT9Vi/SojI0mVhrWaQWspQbmg==
X-Google-Smtp-Source: ABdhPJwXoqSbmvHmhg/EtteVGv0rfE1RDmx00kvLUmrUwmX+eFBzkQTr+WU74TcyMw7apb1YlpZ54g==
X-Received: by 2002:a17:90a:bc0c:: with SMTP id
 w12mr4536221pjr.213.1620905345995; 
 Thu, 13 May 2021 04:29:05 -0700 (PDT)
Received: from localhost.localdomain ([223.236.157.188])
 by smtp.gmail.com with ESMTPSA id p9sm6768807pjb.32.2021.05.13.04.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 04:29:05 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Thu, 13 May 2021 16:58:40 +0530
Message-Id: <20210513112842.707103-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.174 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.174 listed in wl.mailspike.net]
X-Headers-End: 1lh9bq-0001NS-GD
Subject: [Kgdb-bugreport] [PATCH v3 0/2] kdb code refactoring
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
Cc: daniel.thompson@linaro.org, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, mingo@redhat.com, jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Some more kdb code refactoring related to:
- Removal of redundant kdb_register_flags().
- Simplification of kdb defcmd macro logic.

Tested with kgdbtest on arm64, doesn't show any regressions.

Changes in v3:
- Split patch into 2 for ease of review.
- Get rid of kdb_register_flags() completely via switching all user to
  register pre-allocated kdb commands.

Changes in v2:
- Define new structs: kdb_macro_t and kdb_macro_cmd_t instead of
  modifying existing kdb command struct and struct kdb_subcmd.
- Reword commit message.

Sumit Garg (2):
  kdb: Get rid of redundant kdb_register_flags()
  kdb: Simplify kdb_defcmd macro logic

 include/linux/kdb.h            |  27 ++--
 kernel/debug/kdb/kdb_main.c    | 271 +++++++++++++--------------------
 kernel/debug/kdb/kdb_private.h |  13 --
 kernel/trace/trace_kdb.c       |  12 +-
 samples/kdb/kdb_hello.c        |  20 ++-
 5 files changed, 141 insertions(+), 202 deletions(-)

-- 
2.25.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
