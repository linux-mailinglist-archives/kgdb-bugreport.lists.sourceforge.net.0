Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA1ACFB90
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  8 Oct 2019 15:47:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iHpqI-0006GO-KR
	for lists+kgdb-bugreport@lfdr.de; Tue, 08 Oct 2019 13:47:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iHpqH-0006Fz-6x
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Oct 2019 13:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6RWTxHt7zKzXfYPhwl9vO4EuXYxc6AyULIB2uI0LmfM=; b=luQzsfjM6jWlSxCHKossHmV3OS
 ZmcTGHIT3WyXYlrgDiV7nu+arANT9Py/GSMnxEYCuk7QSXrVC89qPek9qTrAK/lBcVol4Ia7kzQsj
 a+ofiVCjGI3i10zL0lGPzXWVFZ42bq+xy+41XHN31zae6qB6lSXKqHKAEfr9BU5Pgbxs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6RWTxHt7zKzXfYPhwl9vO4EuXYxc6AyULIB2uI0LmfM=; b=i
 0M9wEMpuPSuoQGYe15IZ8YI8r+/PesX+m5TG9pXG+/n9aqPxEICJHc3ZD+dyII1ZKmMREwXKIZ5TJ
 34IaMe7f0QQV+NKMlX8duK8nHroHBgVhBvXXCzIz7mkVRydJ8JS26PUkjbr3viy1t3oWPEtfoxD3L
 0cFWLgNjyL5BDepI=;
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iHpqC-00317t-S3
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Oct 2019 13:47:57 +0000
Received: by mail-wr1-f66.google.com with SMTP id o18so19456801wrv.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 08 Oct 2019 06:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6RWTxHt7zKzXfYPhwl9vO4EuXYxc6AyULIB2uI0LmfM=;
 b=cNq1Ed5GzasuMH1y9ug9vDcF22n6vlCP/1FO1m7fvDDoOLyWcX78rM8DONBByZA2Zb
 Gskb17VHPu1a9HWj7EH6TUDdxGVoicMlQ8W4qJXy+KRz5k4fm4PhFv4GHsHPJIQZ0Jqv
 GP5fDn3k5yyZUj3xjRbO/gO9AhSkqWdcKF8oS8v1uoaZ/BGUMHbum5nXQMcC40RhxHlV
 w+ByZ3LHXh9535tKnWf0DaHjjJT+4kf2nE6JHLzzUkIjNOrTvmony6bF22PctzqqJVoh
 vD50IGmZjnoAJS+P767MtqDmVQhDU1LXnjxuuDiKemFKb5wqjt1PLxlzpNFpd6KwOSji
 f6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6RWTxHt7zKzXfYPhwl9vO4EuXYxc6AyULIB2uI0LmfM=;
 b=UTCPgNdGeLJwOcdNpSAHU4vKtVGg7TTJulPjFKSrOIzAeruXqEfZAYkTUNW3aVB7nn
 3ynXi42u95wm8GK3WPFTea7cZPX3Mpj3DuaRKZpUA1gwQ3qLmtYilQtQLLeLd3rc8QIP
 gdoV4XyfajKHmK2ftsR6HDyBsW+CyrqLWnEE7fiXjMyBRQBe63X3FUjOg7/GBVIGANJN
 StYgSIiILCmkT3Kjb6/IEpPxkRmY2xoRMxtVk7uScr8GxAkH8IZN2Q0ys3p6uJxNoc97
 mmVvg/VBKg28Ktwed77NJjQF2oqlyvBi51Hy0V8/71cCkLP3Fk4hd7yVDjL0qFbtz4N5
 /mng==
X-Gm-Message-State: APjAAAWRleZOAyroZixvESSbCKtnr+It+DLCkRRqD9Rw31MJZ/oWfPUj
 FVcoweCGL23685qGsKTjvO0v5DYbbYjr/w==
X-Google-Smtp-Source: APXvYqyCXe2mCxlJgegBeQiMsMW/DceUIxnKsxEr5RLMHNcvj7L1A4ab4Pzav+WZ/SrQVlRdEVrk/g==
X-Received: by 2002:a05:6000:1204:: with SMTP id
 e4mr20944912wrx.5.1570540857894; 
 Tue, 08 Oct 2019 06:20:57 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id t8sm18237214wrx.76.2019.10.08.06.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 06:20:57 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Tue,  8 Oct 2019 14:20:38 +0100
Message-Id: <20191008132043.7966-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iHpqC-00317t-S3
Subject: [Kgdb-bugreport] [PATCH v2 0/5] kdb: Cleanup code to read user
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

Changes in v2:

 - Improve comment in patch 4 to better describe what is happening
 - Rebase on v5.4-rc2

Daniel Thompson (5):
  kdb: Tidy up code to handle escape sequences
  kdb: Simplify code to fetch characters from console
  kdb: Remove special case logic from kdb_read()
  kdb: Improve handling of characters from different input sources
  kdb: Tweak escape handling for vi users

 kernel/debug/kdb/kdb_io.c | 222 ++++++++++++++++++--------------------
 1 file changed, 103 insertions(+), 119 deletions(-)

--
2.21.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
