Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BF490CA10
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 13:45:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJXHa-0003cc-Fa
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 11:45:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1sJXHY-0003cV-9b
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 11:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w1nUX/w35W7jhWMOL3MjUXKKFpQa+k5Ifppyru0Gp1E=; b=eYcNymKmjCYP57lkvhMHn5idOt
 bgjgM3Cy4pElqALLS9EeL9M2fsD1w28Lh4Z70twZ8HKaBcVdR2MpnT26LRFS0XkjmWi3PpUQjQp+Q
 KPlvlvSDkOQ6NwhbONzfk5I1jibq8K8K/hGjGDCHwkUumG592jKPXGEBj6hIAc6As6aw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w1nUX/w35W7jhWMOL3MjUXKKFpQa+k5Ifppyru0Gp1E=; b=IZ16ySvA/+wdc6qxgWU6t6FRa4
 hDrBHrAoaY4EzBQ5Pgbr4zDH/1k9YKoutNq0p/GJ3xUe8LE9/ok9XwTxP9kVkVCG47Hv7Fa/jHoKm
 kbjSXxgeiXdj2vpLSml9eufsWxfj9AFRptj5a525cLSjJEn8s+R6dUAoqbyx7d8vKzB4=;
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJXHZ-00056E-Il for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 11:45:49 +0000
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4218314a6c7so45549925e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 18 Jun 2024 04:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718711137; x=1719315937; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=w1nUX/w35W7jhWMOL3MjUXKKFpQa+k5Ifppyru0Gp1E=;
 b=VeuV4LEuj+X15I7I07cp8lRKWoPTsHuiApdEnw3a5p2QL/DZNXF/uHroVGJmNOwqty
 BPCFnhbUKgzVyAmOPxhPTi6YE3T3fq1lnNtFnKuDV1RZCW8FQSL8cZsOVyi6RMyCsa4X
 p9ieZ5T8FcX4Anni5iCE0y8FK1xVQuKsPMLvHCAIHbCtV9KTF3XOs2HNK3Jla075OMs2
 Ou6zuyEzoRVLiaHjLUA5d6tRyFlan2LMnngufHs5wVrpvv+BlsyD58NDnXDCp4a6BEfF
 TQRsNDoLp/xp76KNkydmKB6GootO26GoWz86vNEtYUGD8zDQKqiLqOUPZ82FKkpvvTUZ
 BoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718711137; x=1719315937;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w1nUX/w35W7jhWMOL3MjUXKKFpQa+k5Ifppyru0Gp1E=;
 b=MRztvGdDiUWHjRYtQRAk29PEkWFuRPf/JH6PwM7C05bVcA1zZ2PWxkQIl9zpZ3GVZC
 mQhJJVlKVR8L/whPZT6dkby5QmJbdlwOunjXtZUl2rqE9Bhbhw1fzm5AaxipcbGDOC8G
 qogvd/vljrtkLb8d/UIiQF5DVXra3cM9LNQpmjbu8JmNf4h6+xI+7Yi1kTFPOHpZStXi
 3T9uoeAldV5CKDyyoZ0gPp09TlW/ft/GBwC7dYJQL1z6sCLQok9Xc91gRFgsY2qXGd2y
 JBplVaoMsfojqVQkb62nAbjNJcSJVhvd+hKdf2Y2l8nQe+kPQDGVp++67xQjHCOLbvlX
 WEUQ==
X-Gm-Message-State: AOJu0Ywkq5P2bwpoFFPnks+A1rwcqhQpX0K+Yz9baPM67GVM27AyitUB
 mJJnQ80hM1Qrcljg6PB8QatvbBg5XPymKxwhZkMBFs9euclIeGVV92W2yHVtP2tzi5ZXngXEe8b
 9yxA=
X-Google-Smtp-Source: AGHT+IHKBDNDrr5MqcJfCJ1fNOiBxzenrX3DYKCxbyPB94Mjsb6jjGhbiJQBUQAJuB6ysUQVSV7D1A==
X-Received: by 2002:a2e:3619:0:b0:2ec:1dfc:45bf with SMTP id
 38308e7fff4ca-2ec1dfc46e6mr58898761fa.42.1718710676831; 
 Tue, 18 Jun 2024 04:37:56 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422870e96f9sm225384615e9.26.2024.06.18.04.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 04:37:56 -0700 (PDT)
Date: Tue, 18 Jun 2024 12:37:54 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20240618113754.GD11330@aspen.lan>
References: <20240618003546.4144638-1-dianders@chromium.org>
 <20240617173426.6.Ia1d546061f9430a90df0e7521097040e0e939c58@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240617173426.6.Ia1d546061f9430a90df0e7521097040e0e939c58@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 17, 2024 at 05:34:40PM -0700, Douglas Anderson
 wrote: > The "mdW" and "mdWcN" generally lets the user control more carefully
 > what word size we display memory in and exactly how many word [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.51 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.51 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.51 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sJXHZ-00056E-Il
Subject: Re: [Kgdb-bugreport] [PATCH 06/13] kdb: Remove "mdW" and "mdWcN"
 handling of "W" == 0
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Thorsten Blum <thorsten.blum@toblux.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jason Wessel <jason.wessel@windriver.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Jun 17, 2024 at 05:34:40PM -0700, Douglas Anderson wrote:
> The "mdW" and "mdWcN" generally lets the user control more carefully
> what word size we display memory in and exactly how many words should
> be displayed. Specifically, "md4" says to display memory w/ 4
> bytes-per word and "md4c6" says to display 6 words of memory w/
> 4-bytes-per word.
>
> The kdb "md" implementation has a special rule for when "W" is 0. In
> this case:
> * If you run with "W" == 0 and you've never run a kdb "md" command
>   this reboot then it will pick 4 bytes-per-word, ignoring the normal
>   default from the environment.
> * If you run with "W" == 0 and you've run a kdb "md" command this
>   reboot then it will pick up the bytes per word of the last command.
>
> As an example:
>   [1]kdb> md2 0xffffff80c8e2b280 1
>   0xffffff80c8e2b280 0200 0000 0000 0000 e000 8235 0000 0000   ...
>   [1]kdb> md0 0xffffff80c8e2b280 1
>   0xffffff80c8e2b280 0200 0000 0000 0000 e000 8235 0000 0000   ...
>   [1]kdb> md 0xffffff80c8e2b280 1
>   0xffffff80c8e2b280 0000000000000200 000000008235e000   ...
>   [1]kdb> md0 0xffffff80c8e2b280 1
>   0xffffff80c8e2b280 0000000000000200 000000008235e000   ...
>
> This doesn't seem like particularly useful behavior and adds a bunch
> of complexity to the arg parsing. Remove it.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  kernel/debug/kdb/kdb_main.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index c013b014a7d3..700b4e355545 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -1611,11 +1611,6 @@ static int kdb_md(int argc, const char **argv)
>
>  	if (isdigit(argv[0][2])) {
>  		bytesperword = (int)(argv[0][2] - '0');
> -		if (bytesperword == 0) {
> -			bytesperword = last_bytesperword;
> -			if (bytesperword == 0)
> -				bytesperword = 4;
> -		}
>  		last_bytesperword = bytesperword;
>  		repeat = mdcount * 16 / bytesperword;

Isn't this now a divide-by-zero?


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
