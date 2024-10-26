Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 708659B2F04
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 28 Oct 2024 12:36:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t5O2Z-0007eT-7p
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 28 Oct 2024 11:36:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nir@lichtman.org>) id 1t4i4m-00057D-6E
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 26 Oct 2024 14:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mz5jJOWSMM1lgSGz29NH1bEK4owMhrFPbiGQV0BSQ3Q=; b=MHVAMh6QkhgGUyKL3pBscR041v
 LVTci/qmE/rYLMcR5mo3pR+/PB3m9OmBggK95vYIYh2BD3SVscufqwL17sh6qpuCAuuc8SmUnmXRn
 aa5Y7jvoA1zMNysm0eO2eZwzOUzjsWu4vgFSaivOyT2CG7rtNv9jVRTTnqLe9F0rUoVM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Mz5jJOWSMM1lgSGz29NH1bEK4owMhrFPbiGQV0BSQ3Q=; b=O
 CTx5d9DDalizUiHkUExx8AMc8ZYT6XLnLPzGZvDpDoe/tweJ1ujZBHzIiaJDIh9FyEG6mPz2ymk/M
 Ag+Zi+Yz5rx5Xq0sYHtxKpNUFaVbrPh5SIzguU6q1tr+v/cgoWnPv4RXELMMKChokCKtMppHRLuvc
 rbNpFyQqPZNljC+0=;
Received: from lichtman.org ([149.28.33.109])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t4i4l-0007FW-E6 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 26 Oct 2024 14:47:36 +0000
Received: by lichtman.org (Postfix, from userid 1000)
 id 90D25177103; Sat, 26 Oct 2024 14:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
 t=1729954044; bh=j+zxkjt/Kb9ZF1jAWfGzqPmaDqTM2RiQ22KLaeHRslQ=;
 h=Date:From:To:Cc:Subject:From;
 b=mbxLIxyoPJjSgjZSh+W916g6DJSQdBE1FmCERgWyFWCx4d0ljEmnc8QCzzGMWXWua
 px4OPssGIc98PD7NatN5drTQm5+VaHmO7FY9pCuS3svpNNWFKhU1FCvruP6krBokcS
 P6dmzVLYtAt0GTOIKZ3HopigNTsJ+beXZ/pABzRRgoZmjyzE/iPbtK35OiC+lkwjOO
 KE7C4Ui1NUaa2lYB+27Wk+GCSABZnGd9q/unCQAYM26Nmmvt/1BnYnfhixy8UhpfJQ
 dqhb6JbOnA+bqP99/gFAs6AggFdxF+3HfSQ+8w8vLUGMxDBd8yAteF8QWDnph0tApQ
 j/r66CBCb1fXg==
Date: Sat, 26 Oct 2024 14:47:24 +0000
From: Nir Lichtman <nir@lichtman.org>
To: kgdb-bugreport@lists.sourceforge.net,
	linux-trace-kernel@vger.kernel.org
Message-ID: <20241026144724.GA892311@lichtman.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The simple_str* family of functions perform no error checking
 in scenarios where the input value overflows the intended output variable.
 This results in these function successfully returning even when [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1t4i4l-0007FW-E6
X-Mailman-Approved-At: Mon, 28 Oct 2024 11:35:55 +0000
Subject: [Kgdb-bugreport] [PATCH v3 0/2] Replace the use of simple_strtol/ul
 functions with kstrto
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
Cc: daniel.thompson@linaro.org, rostedt@goodmis.org,
 linux-kernel@vger.kernel.org, mhiramat@kernel.org, jason.wessel@windriver.com,
 yuran.pereira@hotmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The simple_str* family of functions perform no error checking in
scenarios where the input value overflows the intended output variable.
This results in these function successfully returning even when the
output does not match the input string.

Or as it was mentioned [1], "...simple_strtol(), simple_strtoll(),
simple_strtoul(), and simple_strtoull() functions explicitly ignore
overflows, which may lead to unexpected results in callers."
Hence, the use of those functions is discouraged.

This patch series replaces uses of the simple_strto* series of function
with the safer  kstrto* alternatives.

  
[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull

Yuran Pereira (2):
  kdb: Replace the use of simple_strto with safer kstrto in kdb_main
  trace: kdb: Replace simple_strtoul with kstrtoul in kdb_ftdump
Nir Lichtman (1):
  kdb: Remove fallback interpretation of arbitrary numbers as hex

This patch is originally based upon
https://lore.kernel.org/all/GV1PR10MB65635561FB160078C3744B5FE8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM/

Since the original thread was left with a review and the comments have not been addressed,
decided to continue the minor work left to move this patch forward.

v2:
- Styling fixes
- Fix an invalid conversion to unsigned int instead of signed as it was supposed to be
- Fix one of the conversions to return an error in case of failure, instead of silently falling back to a default value
- Add Douglas's suggestion for removing the hex interpretation fallback
v3: 
- Split to 3 parts instead of 2 (in which the 3rd part now contains the hex interpretation fix)
- Fix the patch series to properly reference the cover
- Fix credit tags

 kernel/debug/kdb/kdb_main.c | 69 +++++++++--------------------------
 kernel/trace/trace_kdb.c    | 15 +++-----
 2 files changed, 23 insertions(+), 61 deletions(-)
--
2.39.2


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
