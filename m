Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0223D666C
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 14 Oct 2019 17:46:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iK2Yc-0004tt-Pp
	for lists+kgdb-bugreport@lfdr.de; Mon, 14 Oct 2019 15:46:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iK2YW-0004tJ-VN
 for kgdb-bugreport@lists.sourceforge.net; Mon, 14 Oct 2019 15:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gqnH5u+Rmz2NG69129OK2vF9yH2mCkTespyQ46VZaP8=; b=JpYUbYMfGdjSTPcDc5cOkrgCZg
 +O3xUqbGFdv11L1inFHcuB3occGS4t28FEtn35PbO7doh1Vg2V5qkCv9wHH6sCBcSdhjMUsNVNISO
 xLX14E6QNLZvxPO/wkaIBNkFQRRCG2dwZnODUOQSn4UP4SmT5eiXCtdFEbcGII7WeotQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gqnH5u+Rmz2NG69129OK2vF9yH2mCkTespyQ46VZaP8=; b=O
 AMsg84xqT9Q/lJ+Xd+N2Xmfmi2n4RdpNalATMhhgSUrDlMPMU2JyxaoX2+qQKD7lcBhKtZdfhJnrS
 kSOaPWFp0PIn6OfESMKH5RDBs3B7+OmapIuBpuqAFUOGCfCBObVMuDR3WLWtbJjYsOd/DokG9Q6b4
 zDJIcvN/uO5zVDAQ=;
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iK2YQ-008vIw-Cp
 for kgdb-bugreport@lists.sourceforge.net; Mon, 14 Oct 2019 15:46:43 +0000
Received: by mail-wm1-f68.google.com with SMTP id b24so17244862wmj.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 14 Oct 2019 08:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gqnH5u+Rmz2NG69129OK2vF9yH2mCkTespyQ46VZaP8=;
 b=JnB1O5QmG2avz0u1r/tYNyNtqVV3ZL9hHVUvFV60SIzhrPzy9leC5ZvDm19z/f4bcO
 0gRaKyu4pgOPEzDnNkaJL6I/DjcFznx8QzRIGuWuWYTY6H5XWW6Quh7P5DtfDTmACNVs
 +0MKKHGZlzVbW4Tsdmzk1TAK/wWE9YRc/JElqor1Q62XSKgfOphUyhi0KdpoPx8ExNvF
 /E+RrbHctSrcNpffZ9br7HF4gDXO+Ey38oQjG3Lv2bzfEQhKyNlOFb1522zQt4FLRiIr
 slZAZdK0wW9bxM8C7TQYVJ9TFwqG1uoMCYYkbsmbZ3pOjwuLxBe1wtaCE00K3rLOOwbA
 MsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gqnH5u+Rmz2NG69129OK2vF9yH2mCkTespyQ46VZaP8=;
 b=kGV0FBgyqIzl7yAAEeS4F9muoq+YjLgmFf7ZLcVx4ypmg7TBExR9aho3etQ8RjhrhH
 J00g7H9wD/ARv84+DoBLyRrzPDeNNBo0qEjSOIkaaZlNk/Eo+V/0TwftOzTAEgG5jKa2
 w9XRftFEd9F7GI2v3AEZmgX51+VizD6/3qIbj4iPiviuwEvi0++FTjOpn0bwg5XBHr/b
 GqpMoOx0opWedHXWaPgmi/Te9bNCKz40sLCsGUy93vu07YLK1JT6oKlHeruJfa9rE+fq
 68zZWzDnKKbmsxV1plhWpMEaa+XFD/eEHF0XmKqJgHtbmfYdslh2QMcL0lCAkifYh2G9
 JSgg==
X-Gm-Message-State: APjAAAV770P5jSOZhE6sIXnqY7Ui7qsEgrVedo8nBBq4XV9bvhcfM5fM
 EzWn0JR+/F3aTHNNycZ/rXW/mQ==
X-Google-Smtp-Source: APXvYqwGT4KOZXWes00rIf6fjnXihAP+4JZg25EojQh4Euuu0pxswSBdYFr1OfRcypxedl5j8+hG4w==
X-Received: by 2002:a7b:c7d3:: with SMTP id z19mr12069411wmk.83.1571067990478; 
 Mon, 14 Oct 2019 08:46:30 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id q22sm16539738wmj.5.2019.10.14.08.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 08:46:29 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Mon, 14 Oct 2019 16:46:21 +0100
Message-Id: <20191014154626.351-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.68 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iK2YQ-008vIw-Cp
Subject: [Kgdb-bugreport] [PATCH v3 0/5] kdb: Cleanup code to read user
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
 kernel/debug/kdb/kdb_io.c      | 229 ++++++++++++++++-----------------
 kernel/debug/kdb/kdb_private.h |   1 +
 3 files changed, 123 insertions(+), 129 deletions(-)

--
2.21.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
