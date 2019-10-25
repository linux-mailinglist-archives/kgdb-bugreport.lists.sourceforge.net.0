Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E51E4488
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 25 Oct 2019 09:33:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iNu6c-00024G-2m
	for lists+kgdb-bugreport@lfdr.de; Fri, 25 Oct 2019 07:33:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iNu6a-000243-VC
 for kgdb-bugreport@lists.sourceforge.net; Fri, 25 Oct 2019 07:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AZwaHL4zUXAc+2jSAvKzwc1oPJbnq12fm9YvyXEq80U=; b=ArpSLL3ifZGrnCK45YucKPl2gB
 wDEVv8J+QXX1EWHyl3qPWdybtar1XutWqbNeQf+wb/ZBZWAmo5Xs58pTfmAdNQJ0MfqqxzCszCtWZ
 T4dxH0VF9wxjaT4ozH10uO+F/HXmwfoHXpiYhc6/a/nHmLkuOS0Nm7ZvXPUGO+lqgRkg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=AZwaHL4zUXAc+2jSAvKzwc1oPJbnq12fm9YvyXEq80U=; b=W
 /3OH94D5Ds1wyaLtGqUbFqKz+hpdoJAH5ebK8yEM4rLOPG7T+d8rkKtX24Ig14lpYAbGFwXX0igmS
 FeaeWwlLaVa9hhXIjPvREwN6P8vJAqEODrd3AvkQAcrGjg5Kk+Z45CyK9MKClb1QE0pJ8llA7w2P9
 IsRwoSYSeDuea0wY=;
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iNu6W-00GRxv-TY
 for kgdb-bugreport@lists.sourceforge.net; Fri, 25 Oct 2019 07:33:52 +0000
Received: by mail-wm1-f66.google.com with SMTP id 11so931459wmk.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 25 Oct 2019 00:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AZwaHL4zUXAc+2jSAvKzwc1oPJbnq12fm9YvyXEq80U=;
 b=cPO878sFxyYN1EKPeQuJv1STDEUAJr98GQYzetFPL6WpyIB18hWX4V2ABvwFcm3jRn
 HnsZNFrinwvAzLvxMZzvJIpL1roUaOWPV5b/KsxP6gfH+Dl3YNr1GRdHpvn/qFhYbEKP
 j+mbqHQgGiGNDiADkDClK/N/Z0uDKefzLlDFpWXaO+sxM7Q4Et5kPiGde42pJYOoXypk
 Lgt12VLvP/SNW2jZe3+Ci+yoJ9bVwpfWIv4y0+g6n7FBThRxYpwPDTk9Ne09WY20+dEi
 eqnRECEquGCOjH+OuJa5aecfkdXeh5LuwxOuudonI1xS1tg+J8bW+GPItBtz4rm5zdjc
 kpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AZwaHL4zUXAc+2jSAvKzwc1oPJbnq12fm9YvyXEq80U=;
 b=bx3mWVU/tgST6zazoAflBh5VfMH65jt33MEYQr/nAmzUepfj5Toqd6hvKByGblYx7C
 tHNCScSmAQgApEBAaQ9O0BaBaiD+ViD17QxTEj9PPyo/bxQNXoOwck1F0TBXewAi2Uhh
 jNV2nFXHkSP1WAkEBspFggnyhaozWKxKMNHFAdxkQBNXxGDOpAo2W69Xr6+lQdWeyawv
 Q0O/Hh7Vl5ctI7jFGLvVyXu35L+ON6k5qQxMdGNH3He772a5axcts3wTB+Igk4/YKp7u
 DRpouL0KpfC7n3KR8Ix2/ZMSvsFrc/IahJ146ypWyQp3AliyRrN6whnrk08zMkc1qNsh
 Oq+Q==
X-Gm-Message-State: APjAAAVYkevTENAMM5Po8pYJ0wHkhr0E3c44hw3PAOtKqgESuuSfLcXz
 zqjCBly+XArYECqPPtXZ3BAoMQ==
X-Google-Smtp-Source: APXvYqyHtw1To5nIiVgf+IJKA3aSW6xtEhJEmCS+qT03yi8R7IUoUo5PIOyYFa+izhGvlsOZA/ldGw==
X-Received: by 2002:a1c:730e:: with SMTP id d14mr2113496wmb.165.1571988822284; 
 Fri, 25 Oct 2019 00:33:42 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id a11sm1586602wmh.40.2019.10.25.00.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 00:33:41 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>
Date: Fri, 25 Oct 2019 08:33:23 +0100
Message-Id: <20191025073328.643-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iNu6W-00GRxv-TY
Subject: [Kgdb-bugreport] [PATCH v4 0/5] kdb: Cleanup code to read user
 input and handle escape sequences
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org,
 patches@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

I've been meaning to repost this for some time, and inspired by
having someone keen to review it, I dug it out again!

I split this as carefully as I could into small pieces but the original
code was complex so even in small bits it doesn't make for light
reading.  Things do make more sense once you realize/remember that
escape_delay is a count down timer that expires the escape sequences!

Most of the patches are simple tidy ups although patches 4 and 5
introduce new behaviours. Patch 4 shouldn't be controversial but
perhaps patch 5 is (although hopefully not ;-) ).

Mostly this is auto tested, see here:
https://github.com/daniel-thompson/kgdbtest/commit/c65e28d99357c2df6dac2cebe195574e634d04dc

Changes in v4:

 - Sorry this is late. Looks like I got so distracted by testing the
   series I forgot to post it to the lists.
 - Introduced kdb_handle_escape() in patch 1 (instead of renaming it
   in the middle of the patch series) and documented it in kernel doc
   format.
 - Adopted do {} while for the character fetch loop in kdb_bt.c
 - Added Doug's reviewed-by to the remaining patches. The kept them
   despite the subtle internal reorg w.r.t. kdb_handle_escape() since
   the whole patchset has changed little since he last saw it (beyond
   fixing his review comments).

Changes in v3:

 - Accepted all review comments from Doug (except the return type
   of kdb_getchar() as discussed in the mail threads). In particular
   this fixes a bug in the handling of the btaprompt.
 - Added Doug's reviewed-by to patches 1 and 2.

Changes in v2:

 - Improve comment in patch 4 to better describe what is happening
 - Rebase on v5.4-rc2

Daniel Thompson (5):
  kdb: Tidy up code to handle escape sequences
  kdb: Simplify code to fetch characters from console
  kdb: Remove special case logic from kdb_read()
  kdb: Improve handling of characters from different input sources
  kdb: Tweak escape handling for vi users

 kernel/debug/kdb/kdb_bt.c      |  22 ++--
 kernel/debug/kdb/kdb_io.c      | 231 ++++++++++++++++-----------------
 kernel/debug/kdb/kdb_private.h |   1 +
 3 files changed, 125 insertions(+), 129 deletions(-)

--
2.21.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
