Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C7D90C0ED
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 03:05:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJNIC-0008TB-75
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 01:05:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sJNIB-0008T5-N6
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 01:05:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k0wDlLxN8nsz23vuD5cVykEn+53xHNnMwK+3wqmFHa8=; b=TBBCMOe4nGXc/T7v9MqTtcOLxX
 nUzt949QFABmuM/woQAz2SXiKCwFd6BZ/g4uEW7Q43Beb9r1cK8Pqa3OiMsdCZKISaHoklq/7unxN
 0DnZGN/9iySr70dGXSJsqkP5Hi2KvxHXfAy/tm6C7Ps6qiK8gf4bfyaINjkaqRs9orPg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k0wDlLxN8nsz23vuD5cVykEn+53xHNnMwK+3wqmFHa8=; b=fmF38FZUZoScgkdIGNHxlIGA5m
 o1wRy0PJWBecBetDmhRcgwsLuJ0079nnqg04CX9t0DmS8yP0I0NuPO5jr68UFN7H5sYzX/Rjmrg+E
 PDxQZ1RRxUL7R7zN39ljD9EqmELkyNjWmhjXkJTNo2L6HjrYooMVoV27A5dU5W01Jpj4=;
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJNIB-0006CV-3g for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 01:05:47 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-6f971cb3c9cso2772172a34.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 17 Jun 2024 18:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718672740; x=1719277540;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k0wDlLxN8nsz23vuD5cVykEn+53xHNnMwK+3wqmFHa8=;
 b=etauoewfjxixAwtEd/mlkqaCWQ2tYqufaC7zKByraogbTtY0am688xxEkP7BPNKxfT
 HWoDNuh364ncKlOs1m+AZug7EHSUlaphlZqv3mbhWi9uiy+r3bnFiRjyw7jZpBjoJnp0
 h5TLedYCew/777mMCoY6gOTMElACGKqG3Wiv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718672740; x=1719277540;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k0wDlLxN8nsz23vuD5cVykEn+53xHNnMwK+3wqmFHa8=;
 b=QwDdffBGYmZyloCBAmHnEaZPxOEJgbtMjb8+nN+xFpTBbtv+bWWtty1FueHV3Mmbho
 vCTOshqCtOTcUtQ5rUINMwcU4uA3es4mgTPvc/FFeEPV6AJZkZr4ksL6Y4JxLd410lQJ
 OtLyflS+yLEZAxk+z8wxBEhyPAfv9piv6ly3jUx2bDGKmwYy3EM7qzZu78IXRZyqNICK
 EP84fM/Pq46g42l7+HSAvaTEBzq9qFii5Jl3hoocwHEAe8eRpBn/k6F4IvbNSzD2aWbv
 ZSOB9kNmJOq2BbV4u69LbZk8hKP1rHoWzrXOoRH/tS3c///8SKMVdcs9UpWuM7RT/2Mj
 jt5A==
X-Gm-Message-State: AOJu0YzhneO+iIEOxC1jHqp0CK3V4maXJeyrVw66J89gXKqyDQhL9p60
 Tx9+5uVznQfSfYlzm2uPQh/tAdunuKhC96dR1QgpqjlM7xc8ExbIeZ/iF/O4VlorKLiCmj+dsGw
 =
X-Google-Smtp-Source: AGHT+IFy14sjKwgsvXgu8myES4EXDcuaWAWfoXtGNeK0UrAt4zfV1HHSU27q2aFhIP++Yo5ZHVgVLA==
X-Received: by 2002:a05:6a20:12c1:b0:1b5:d143:72e7 with SMTP id
 adf61e73a8af0-1bae7f0f0b5mr10933240637.32.1718670980430; 
 Mon, 17 Jun 2024 17:36:20 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:1798:e71b:11ad:8b94])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb99f4dsm7905917b3a.216.2024.06.17.17.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 17:36:19 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Date: Mon, 17 Jun 2024 17:34:41 -0700
Message-ID: <20240617173426.7.Ie8aa2af2df12c2e9dc510f003a301401a1ac97fb@changeid>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
In-Reply-To: <20240618003546.4144638-1-dianders@chromium.org>
References: <20240618003546.4144638-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In general, "md"-style commands are meant to be "repeated".
 This is a feature of kdb and "md"-style commands get it enabled because they
 have the flag KDB_REPEAT_NO_ARGS. What this means is that if yo [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.210.52 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.52 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.52 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.52 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJNIB-0006CV-3g
Subject: [Kgdb-bugreport] [PATCH 07/13] kdb: Tweak "repeat" handling code
 for "mdW" and "mdWcN"
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
 Thorsten Blum <thorsten.blum@toblux.com>, linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jason Wessel <jason.wessel@windriver.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

In general, "md"-style commands are meant to be "repeated". This is a
feature of kdb and "md"-style commands get it enabled because they
have the flag KDB_REPEAT_NO_ARGS. What this means is that if you type
"md4c2 0xffffff808ef05400" and then keep hitting return on the "kdb>"
prompt that you'll read more and more memory. For instance:
  [5]kdb> md4c2 0xffffff808ef05400
  0xffffff808ef05400 00000204 00000000                     ........
  [5]kdb>
  0xffffff808ef05408 8235e000 00000000                     ..5.....
  [5]kdb>
  0xffffff808ef05410 00000003 00000001                     ........

As a side effect of the way kdb works is implemented, you can get the
same behavior as the above by typing the command again with no
arguments. Though it seems unlikely anyone would do this it shouldn't
really hurt:
  [5]kdb> md4c2 0xffffff808ef05400
  0xffffff808ef05400 00000204 00000000                     ........
  [5]kdb> md4c2
  0xffffff808ef05408 8235e000 00000000                     ..5.....
  [5]kdb> md4c2
  0xffffff808ef05410 00000003 00000001                     ........

In general supporting "repeat" should be easy. If argc is 0 then we
just copy the results of the arg parsing from the last time, making
sure that the address has been updated. This is all handled nicely in
the "if (argc == 0)" clause in kdb_md().

Oddly, the "mdW" and "mdWcN" code seems to update "last_bytesperword"
and "last_repeat", which doesn't seem like it should be necessary. It
appears that this code is needed to make this use case work, though
it's a bit unclear if this is truly an important feature to support:
  [1]kdb> md2c3 0xffffff80c8e2b280
  0xffffff80c8e2b280 0200 0000 0000                            ...
  [1]kdb> md2c4
  0xffffff80c8e2b286 0000 e000 8235 0000                       ...

In order to abstract the code better, remove the code updating
"last_bytesperword" and "last_repeat" from the "mdW" and "mdWcN"
handling. This breaks the above case where the user tweaked "argv[0]"
and then tried to somehow leverage the "repeat" code to do something
smart, but that feels like it was a misfeature anyway.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/debug/kdb/kdb_main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 700b4e355545..3c6fffa8509a 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -1611,7 +1611,6 @@ static int kdb_md(int argc, const char **argv)
 
 	if (isdigit(argv[0][2])) {
 		bytesperword = (int)(argv[0][2] - '0');
-		last_bytesperword = bytesperword;
 		repeat = mdcount * 16 / bytesperword;
 		if (!argv[0][3])
 			valid = true;
@@ -1621,7 +1620,6 @@ static int kdb_md(int argc, const char **argv)
 			mdcount = ((repeat * bytesperword) + 15) / 16;
 			valid = !*p;
 		}
-		last_repeat = repeat;
 	} else if (strcmp(argv[0], "md") == 0)
 		valid = true;
 	else if (strcmp(argv[0], "mds") == 0)
-- 
2.45.2.627.g7a2c4fd464-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
