Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E106333F6BF
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 Mar 2021 18:27:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lMZx7-0005HB-N4
	for lists+kgdb-bugreport@lfdr.de; Wed, 17 Mar 2021 17:27:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <rdunlap@infradead.org>) id 1lMZwu-0005E0-1T
 for kgdb-bugreport@lists.sourceforge.net; Wed, 17 Mar 2021 17:27:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vDj5QLKIY3+m6sVOEX2/jPJ7XcnGNcq6gqehl799e4E=; b=DR+398wB44+qAFpd78+6jWbAYj
 EKSWrIye6PVvgjMfEVGu6kyzIZfdHpno2Sx0dhu+vU3kth/Hrm6aLa9A+cCQORqAkbXImP2oww+k3
 tEktQqdnziKETzb0An30VE1lysZ/30L35LW+u5Krro00QpmsPRXtqlKBxO4CATcHGMHA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vDj5QLKIY3+m6sVOEX2/jPJ7XcnGNcq6gqehl799e4E=; b=d4t7WJ1JzwYqbFUPG0KI8KftkV
 DAavbhkOUpgctU1jOIKvw0iJTGI+Gp8eTYBbyngRQ+QwqhQ2KmnP5deGOJUDcmOCNsIHlGG2oJiI/
 pLwkg7nTQJWFKkiWQrjWR466wnyaUWzbuDw5FoFYdIWmJKZyXOsW21mzaKsv75lQaSEs=;
Received: from merlin.infradead.org ([178.238.156.107])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lMZwj-00BSf3-LF
 for kgdb-bugreport@lists.sourceforge.net; Wed, 17 Mar 2021 17:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=vDj5QLKIY3+m6sVOEX2/jPJ7XcnGNcq6gqehl799e4E=; b=G6KhVHbQM3vbUK+ZBzGCp55hmc
 BnZihHW468IxB3IqHulkTPnoU6ZSbePHcPe4BovE3fcWm1oDTvJWXw6jkr4VS6FGuNZxcbGMjvWxV
 5qC+BUNHXHOGHyPbjrSTiLdb4ic4r44T9fYeWXjRQfmzinkOzFKRsywbWfSXPkthXlztNYyg4I9ku
 Is/Efy12OaPvKk66k6L/xsUpFTP+c5T2eC8wivoHonuxl1f64Fof4DUoOb4EDfjNjB6l1H9c1eCe8
 Va9j+dS1Zr7q2LkitVoLhUKn6c04UI4NNc283SEU8ISGYi4/aHb67pcpeJxFDx1G+DITWz9/KnMuo
 JElq35MQ==;
Received: from [2601:1c0:6280:3f0::9757]
 by merlin.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMZwY-001fQE-Is; Wed, 17 Mar 2021 17:26:50 +0000
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, jason.wessel@windriver.com,
 daniel.thompson@linaro.org, dianders@chromium.org,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20210317104658.4053473-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f7f9fc7f-3e6d-b9a8-b854-620d928b1f24@infradead.org>
Date: Wed, 17 Mar 2021 10:26:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317104658.4053473-1-unixbhaskar@gmail.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lMZwj-00BSf3-LF
Subject: Re: [Kgdb-bugreport] [PATCH V2] kernel: debug: Ordinary typo fixes
 in the file gdbstub.c
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 3/17/21 3:46 AM, Bhaskar Chowdhury wrote:
> s/overwitten/overwritten/
> s/procesing/processing/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> Changes from V1:
>  As Daniel pointed out, I was misdoing a check,so corrected
> 
>  kernel/debug/gdbstub.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
> index e149a0ac9e9e..8372897402f4 100644
> --- a/kernel/debug/gdbstub.c
> +++ b/kernel/debug/gdbstub.c
> @@ -321,7 +321,7 @@ int kgdb_hex2long(char **ptr, unsigned long *long_val)
>  /*
>   * Copy the binary array pointed to by buf into mem.  Fix $, #, and
>   * 0x7d escaped with 0x7d. Return -EFAULT on failure or 0 on success.
> - * The input buf is overwitten with the result to write to mem.
> + * The input buf is overwritten with the result to write to mem.
>   */
>  static int kgdb_ebin2mem(char *buf, char *mem, int count)
>  {
> @@ -952,7 +952,7 @@ static int gdb_cmd_exception_pass(struct kgdb_state *ks)
>  }
> 
>  /*
> - * This function performs all gdbserial command procesing
> + * This function performs all gdbserial command processing
>   */
>  int gdb_serial_stub(struct kgdb_state *ks)
>  {
> --


-- 
~Randy



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
