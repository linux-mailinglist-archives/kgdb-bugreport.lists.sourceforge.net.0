Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AD5BE632
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 25 Sep 2019 22:12:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iDDeA-0004MI-1B
	for lists+kgdb-bugreport@lfdr.de; Wed, 25 Sep 2019 20:12:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iDDe6-0004LT-IM
 for kgdb-bugreport@lists.sourceforge.net; Wed, 25 Sep 2019 20:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8qVaZZ43ja/qcq7x9zxG+MY20SnpBFpxdeCeslhLULM=; b=fu4jwuA/Wmv7erdZK4IDbi7G4M
 9hrw/A3JQ5N4pjw5YsVLq/8ZvpunBPN/c7OJP9JdugVg8/tnjcz4GYQmPp2k3vQXWNe3TY5BAa/g9
 w/F2pAO1AbI+o+2qteu9WulOXW8uzm8oibVffoIQvndwcJx30NgDOWXxO8lvc9/bgiCc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8qVaZZ43ja/qcq7x9zxG+MY20SnpBFpxdeCeslhLULM=; b=bmrC5X1X8ukvt5xaRjliH72dBl
 dUnopscEzaNX56g0jO6SdETBXBz4mEg61IR4ccGpGFH15+eVadWKal9wUSezjwn/4r0LkttQvLJgP
 oAfu2dW7OdILnVy8orHYoz6fs2NEsn02ax8kmouVYPVYEnA3uZ1h+eC6A7Ti1iPwS/wA=;
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iDDe4-006hhX-06
 for kgdb-bugreport@lists.sourceforge.net; Wed, 25 Sep 2019 20:12:17 +0000
Received: by mail-pf1-f196.google.com with SMTP id y72so40973pfb.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 25 Sep 2019 13:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8qVaZZ43ja/qcq7x9zxG+MY20SnpBFpxdeCeslhLULM=;
 b=MODdFeoDS/EYzK9PjUumV7cHcAyNtzaIuHoa6fKFH60bbpt6z++ueOKM2j+RF4dH1o
 UxrQz9DCdQUlSL6SXHyc0WsToHouKzlYiyB1MDtZrTWCbJOo8gshngC9g7JdD6HmEMqR
 vcKlMBLGJGsDck0cZhZMJ0mabAUCaEmDCD3O4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8qVaZZ43ja/qcq7x9zxG+MY20SnpBFpxdeCeslhLULM=;
 b=Til7TQD+jimcQvb0294TaUl4HqiC+qovt3CwRrm9VGi1HbR6KNCiNL+nGuHp5ENi5L
 UdqFCrCGiw0uZHzLxYbxA+gQKPKAP/Umaa76zX9OD6jsml6gLFhWccAHJjcHs+hkCvtQ
 I15Yiu5by3lsSr9yC6ZYpzJNE5j/YItGSW7H37+fVibfywoQXq6G8/cUdi1PVtIuEvRg
 F2UImW73DAWIygeGJdHX4ogQ8SqPZCHcAvTw74gKQ/vYbZVRI7UpCzi+3jP2HHAa45f2
 l4QVzKhJ+58kRGgdoFtVspp1DFJajJ8uBMNpN/owI8u2Lh9xLtpBEpnihFvq0usJtfaH
 ytZA==
X-Gm-Message-State: APjAAAWOWcX5KbraFairbmSv2n+ZO6WyU9C1IzgO/6WpzDjNOMzVUmEO
 zdJy9ZnxlQc3qmvwAlIZhph5BHl0AEM=
X-Google-Smtp-Source: APXvYqwDJr7Hf4yBf20t8MGHRDdahOqDxk/sPU6nBYELJqmRR8em/Icc12fFJKqGcK5gz+2JTu2Xrg==
X-Received: by 2002:aa7:9a48:: with SMTP id x8mr300666pfj.201.1569441769803;
 Wed, 25 Sep 2019 13:02:49 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id d76sm458113pga.80.2019.09.25.13.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 13:02:49 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>
Date: Wed, 25 Sep 2019 13:02:17 -0700
Message-Id: <20190925125811.v3.1.I31ab239a765022d9402c38f8a12d9f7bae76b770@changeid>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
In-Reply-To: <20190925200220.157670-1-dianders@chromium.org>
References: <20190925200220.157670-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iDDe4-006hhX-06
Subject: [Kgdb-bugreport] [PATCH v3 1/4] kgdb: Remove unused DCPU_SSTEP
 definition
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From doing a 'git log --patch kernel/debug', it looks as if DCPU_SSTEP
has never been used.  Presumably it used to be used back when kgdb was
out of tree and nobody thought to delete the definition when the usage
went away.  Delete.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Patch ("Remove unused DCPU_SSTEP definition") new for v3.

Changes in v2: None

 kernel/debug/debug_core.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/debug/debug_core.h b/kernel/debug/debug_core.h
index b4a7c326d546..804b0fe5a0ba 100644
--- a/kernel/debug/debug_core.h
+++ b/kernel/debug/debug_core.h
@@ -33,7 +33,6 @@ struct kgdb_state {
 #define DCPU_WANT_MASTER 0x1 /* Waiting to become a master kgdb cpu */
 #define DCPU_NEXT_MASTER 0x2 /* Transition from one master cpu to another */
 #define DCPU_IS_SLAVE    0x4 /* Slave cpu enter exception */
-#define DCPU_SSTEP       0x8 /* CPU is single stepping */
 
 struct debuggerinfo_struct {
 	void			*debuggerinfo;
-- 
2.23.0.351.gc4317032e6-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
