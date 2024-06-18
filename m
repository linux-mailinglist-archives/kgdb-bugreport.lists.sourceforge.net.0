Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DA190D732
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 17:26:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJajA-00040w-Px
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 15:26:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1sJaj9-00040j-JC
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 15:26:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j5B2trNpXh5L0I47RQYjAXwFGQO0vFRPcG1PhQTg8CE=; b=mv+QK1Vp0hN0dBpZp8bYCphmh1
 mV7hcDrj1GQX9vw/y1pZU8jKo0B8URqGvylS1e+BxOo7gEtM331S+r6g9D/6Z2as79smYlYJLNRfN
 dKVvQIuc6Tz+xfdPOJ5X5rtM5jBTXOLZjxNWIqAmFocq8QuvxrIzWwc/tFL1AnE7wbu0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j5B2trNpXh5L0I47RQYjAXwFGQO0vFRPcG1PhQTg8CE=; b=bhZpqGRRIzAGhr+odP/XkXsjRe
 OvPoEvqqrVp97aE8Ymrj1SYRJpRDRPVPl89ESSpCyTQO5dPeUZQ9vGR4Q9vfBhX5j9O9vjtfz67tl
 Mu9Y0une7+be/TDtKyEjrAcMlq+azvBZOWSRkHvL8OcAoH3dFg++RymbOeCii3To0ijk=;
Received: from mail-wr1-f41.google.com ([209.85.221.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJaj9-00087R-UN for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 15:26:31 +0000
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-35f1c567ae4so4328489f8f.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 18 Jun 2024 08:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718724380; x=1719329180; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=j5B2trNpXh5L0I47RQYjAXwFGQO0vFRPcG1PhQTg8CE=;
 b=dSynwzvPkuDu/FaTm7txsAk7+s9y9fEiuZ3m50g2YtgoosZFZnorOiYPYWQ/woVhCZ
 XQS5mp7Dzl4IC+9PvkFu9lrddPXRHXNjKOAoX23eolyw61lKUD4cQP71k84FbTTfwc5f
 1lCzl/XNr0/TwWD3a3FBPn94gKzxq/RvYyGORuDKxRvU54puieLODmLY3L+cIIf96sZ7
 WIN5bu98oR1oaiGbCVHmP5eas/W//TTTFOm5qpO+FC54MTrIqcKtA/jOVC8F0OZpEao4
 K61ik+eksQs9bhalq5viifmiVfVHDwSaujGzk/gHu4MY1cyicTDkxBRyW3T+fv+Mn8rv
 kwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718724380; x=1719329180;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j5B2trNpXh5L0I47RQYjAXwFGQO0vFRPcG1PhQTg8CE=;
 b=miGS+6rYzkE9PMsfBActddQfONRtOmzB3oycZuf4KI6GiGK+lnp0HBQpuI2yNIxQIc
 kAWaSaYApc6JncmFMQpL4I9ZtnKPQl/tEhEI1G/g76vP7J+Ct7UnngKtrZD58Luslhmi
 cje2wcCZIeUE5uuyyrUzPVQC4I71B7aaXPTL2BuDAAVlpabaN7lTSChJMc7ItLC/e69D
 nZO1MrxUMNHiGGYV8iZtEuhpBZ1uhJAFQJv72lVzXbDpNHaeyZNI8kfPoSCWYFCNwMk/
 XoytHMyCSOiCek58w8bMqy6W5ldNsA5YNW4jogfuJ2UPXocKqbPBrPuIONi50o+qC7ks
 C8IQ==
X-Gm-Message-State: AOJu0YyZEWytCXqMveC1COsUViqrsprx1sa+OpijH4qnwNzKmv5wsquC
 uhMMdKC+KeL8By/5mwE0zU3iAD5zBBXwbmRS2+wMlGu99SK7UpZs4S9AlJtkTqc=
X-Google-Smtp-Source: AGHT+IFko0ZVQHKPPOkLVKQkbHGo/8Z4TkJ5VFh493yXuyA4aG+1zvplXZXGK68vb6yBbrYE7fPF8g==
X-Received: by 2002:a5d:5917:0:b0:360:7c13:761e with SMTP id
 ffacd0b85a97d-3607c137725mr10358113f8f.65.1718724379686; 
 Tue, 18 Jun 2024 08:26:19 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36268ad16b6sm1097771f8f.92.2024.06.18.08.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 08:26:19 -0700 (PDT)
Date: Tue, 18 Jun 2024 16:26:17 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20240618152617.GF11330@aspen.lan>
References: <20240618003546.4144638-1-dianders@chromium.org>
 <20240617173426.9.I95a99321878631c9ed6a520feba65b949f948529@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240617173426.9.I95a99321878631c9ed6a520feba65b949f948529@changeid>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 17, 2024 at 05:34:43PM -0700, Douglas Anderson
 wrote: > Several of the integers in kdb_md() should be marked unsigned. Mark
 > them as such. When doing this, we need to add an explicit cast [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.221.41 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.221.41 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.221.41 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.41 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sJaj9-00087R-UN
Subject: Re: [Kgdb-bugreport] [PATCH 09/13] kdb: Use 'unsigned int' in
 kdb_md() where appropriate
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

On Mon, Jun 17, 2024 at 05:34:43PM -0700, Douglas Anderson wrote:
> Several of the integers in kdb_md() should be marked unsigned. Mark
> them as such. When doing this, we need to add an explicit cast to the
> address masking or it ends up getting truncated down to "int" size.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  kernel/debug/kdb/kdb_main.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index fcd5292351a7..c064ff093670 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -1594,8 +1594,8 @@ static void kdb_md_line(const char *fmtstr, unsigned long addr,
>  static int kdb_md(int argc, const char **argv)
>  {
>  	static unsigned long last_addr;
> -	static int last_radix, last_bytesperword, last_repeat;
> -	int radix = 16, mdcount = 8, bytesperword = KDB_WORD_SIZE, repeat = 0;
> +	static unsigned int last_radix, last_bytesperword, last_repeat;
> +	unsigned int radix = 16, mdcount = 8, bytesperword = KDB_WORD_SIZE, repeat = 0;
>  	char fmtchar, fmtstr[64];
>  	unsigned long addr;
>  	unsigned long word;
> @@ -1722,11 +1722,11 @@ static int kdb_md(int argc, const char **argv)
>
>  	/* Round address down modulo BYTESPERWORD */
>
> -	addr &= ~(bytesperword-1);
> +	addr &= ~((unsigned long)bytesperword - 1);

I think the round_down() macro will take care of the cast for you (and
probably render the comment pointless too).

Other than that it looks like a good change.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
