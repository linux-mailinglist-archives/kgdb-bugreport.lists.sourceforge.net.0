Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F0790CCCB
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 14:57:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJYOs-0007WH-Tz
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 12:57:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1sJYOr-0007W8-AR
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 12:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RbjTbEXM1rhyPvCrzJoEnRCjMhlrNa3uzeM59k9vu6c=; b=QAeOXC+KyUoZRqaObFH40fBhVz
 JISt1VtlE4g9sUnB7mtvrk70ZCCnn3xyoQJtfoNPpYs5rNpyi2FhUx2oMs6FSWWscYvEExeMr8TFm
 t3GG/PR4f7n0p2ztr/T61KZBSyBRUQslrgcZHQzhJ+/Ff5OjVXRrMo7W7SZB/Wla9tjY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RbjTbEXM1rhyPvCrzJoEnRCjMhlrNa3uzeM59k9vu6c=; b=D0Yzp94dF0ZoNDwVqvR9IJmJZf
 w/iyfp0KTvYf+aX8+3xp8CW3usvQp10u5eDqZnntolTaRw4Gvh7EsNl+ELGfXpvgEYvEnpfLanv89
 2j9SumOYuT56ojzphhKv49HbA5k3GPiFS2WKzEZDYdKiZJcJ6iwLfcFxpcrvZ+PNnzrM=;
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJYOq-000050-Ka for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 12:57:24 +0000
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42165f6645fso43915605e9.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 18 Jun 2024 05:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718715432; x=1719320232; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RbjTbEXM1rhyPvCrzJoEnRCjMhlrNa3uzeM59k9vu6c=;
 b=POqJNgwortXJUsGGDMTSfCvXnjnf8qNUKxDNEYy7y3TVWFk48yoRivveBthMjOv+DB
 0ljICkNguGfjpEYPlwzazlNSDyZc7HSCdtsDjBS2F+duVXORY/KYZwePUjPxWqw71pvJ
 1H/jDbMW9OAxGcI9ryDE8rZB0zEvMKwMcJ8yin+iKUjfix1hbywgGKYelYoqzD2ElG8a
 eK0d+d5YhgzpOgolM0nbS4fGjIEKhEp6xkpWCOBfsyJOUApfUdDT/GPVVGOrEqQR5cEj
 NtoV4K254hUgoltQQ8Xqc9ti5XbOjZGf2FNYFjdZ3wOyzs3bijqIzCXfL4sJ26G65pBw
 yItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718715432; x=1719320232;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RbjTbEXM1rhyPvCrzJoEnRCjMhlrNa3uzeM59k9vu6c=;
 b=JNr3YkEn0aBjEWSsCSuVnL53M9WoqL9jtygF9p/mFTBp/Ft1jCGDZQXBxiQ3atgk7g
 C4+WqDiI39j5lvn3cVB4+yRQfezgTHAdDIh2rJ7ZOmBIp6qbT5n7oFwTGiZMm3gXLwtn
 ZqmCzldbqU2I+6vd9kUnQQekwib66bQbQyby285tYK32DeeHnXQBf8Vts78O4/glx3X6
 MuOPJzGnjaDm7dIjfaNzSbkjUI4QsBiWRpzr28ExpCUiaVFMsJh0qOM8L8rlgrxusbxJ
 pGlkWjBw2Pn0MlaaZK9eT2JE4WoQ1RvrMJQY2Q2964n83qNgmjrv+dHxdkkabTF0KPH7
 VHTA==
X-Gm-Message-State: AOJu0YxlGTD7yCgN8YXyi5z/1pothXiNcMBgpNkqZf+FFOIaDmbWzd+o
 IfJ/zG0ohI4Al14Oa+B2koTvK7AtdA4Tfg0hS/pMjKts01y7oWLN1RHTSLdCmUXXKagnZt0Thmq
 pyMc=
X-Google-Smtp-Source: AGHT+IEj25bGB+7W9l+ETh3T8M6eWkgzBT9LugX6g1oKQJQ4kvRTbQG+s7sBjsfNicqR/X3eXtThYw==
X-Received: by 2002:a5d:4c4f:0:b0:360:7809:ff0b with SMTP id
 ffacd0b85a97d-3607a77af36mr7982159f8f.51.1718715432145; 
 Tue, 18 Jun 2024 05:57:12 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750f224esm13949181f8f.66.2024.06.18.05.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 05:57:11 -0700 (PDT)
Date: Tue, 18 Jun 2024 13:57:10 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20240618125710.GE11330@aspen.lan>
References: <20240618003546.4144638-1-dianders@chromium.org>
 <20240617173426.7.Ie8aa2af2df12c2e9dc510f003a301401a1ac97fb@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240617173426.7.Ie8aa2af2df12c2e9dc510f003a301401a1ac97fb@changeid>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 17, 2024 at 05:34:41PM -0700, Douglas Anderson
 wrote: > In general, "md"-style commands are meant to be "repeated". This
 is a > feature of kdb and "md"-style commands get it enabled becaus [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.128.47 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.47 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.47 listed in bl.score.senderscore.com]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.47 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sJYOq-000050-Ka
Subject: Re: [Kgdb-bugreport] [PATCH 07/13] kdb: Tweak "repeat" handling
 code for "mdW" and "mdWcN"
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

On Mon, Jun 17, 2024 at 05:34:41PM -0700, Douglas Anderson wrote:
> In general, "md"-style commands are meant to be "repeated". This is a
> feature of kdb and "md"-style commands get it enabled because they
> have the flag KDB_REPEAT_NO_ARGS. What this means is that if you type
> "md4c2 0xffffff808ef05400" and then keep hitting return on the "kdb>"
> prompt that you'll read more and more memory. For instance:
>   [5]kdb> md4c2 0xffffff808ef05400
>   0xffffff808ef05400 00000204 00000000                     ........
>   [5]kdb>
>   0xffffff808ef05408 8235e000 00000000                     ..5.....
>   [5]kdb>
>   0xffffff808ef05410 00000003 00000001                     ........
>
> As a side effect of the way kdb works is implemented, you can get the
> same behavior as the above by typing the command again with no
> arguments. Though it seems unlikely anyone would do this it shouldn't
> really hurt:
>   [5]kdb> md4c2 0xffffff808ef05400
>   0xffffff808ef05400 00000204 00000000                     ........
>   [5]kdb> md4c2
>   0xffffff808ef05408 8235e000 00000000                     ..5.....
>   [5]kdb> md4c2
>   0xffffff808ef05410 00000003 00000001                     ........
>
> In general supporting "repeat" should be easy. If argc is 0 then we
> just copy the results of the arg parsing from the last time, making
> sure that the address has been updated. This is all handled nicely in
> the "if (argc == 0)" clause in kdb_md().
>
> Oddly, the "mdW" and "mdWcN" code seems to update "last_bytesperword"
> and "last_repeat", which doesn't seem like it should be necessary. It
> appears that this code is needed to make this use case work, though
> it's a bit unclear if this is truly an important feature to support:
>   [1]kdb> md2c3 0xffffff80c8e2b280
>   0xffffff80c8e2b280 0200 0000 0000                            ...
>   [1]kdb> md2c4
>   0xffffff80c8e2b286 0000 e000 8235 0000                       ...
>
> In order to abstract the code better, remove the code updating
> "last_bytesperword" and "last_repeat" from the "mdW" and "mdWcN"
> handling. This breaks the above case where the user tweaked "argv[0]"
> and then tried to somehow leverage the "repeat" code to do something
> smart, but that feels like it was a misfeature anyway.

I'm not too keen on "successfully" doing the wrong thing.

In that light I'd view this as a feature that is arguably simpler to
implement than it is to error check *not* implementing it. In other
words by the time you add error checking to the argc == 0 path to
spot mismatches then you are better off honouring the user request
rather then telling them they got it wrong.


Daniel.


PS I have never done so but I also wondered if it is reasonable to use
   this feature to manually decompose structures. For example:

     md1c1 structure_pointer; md1c7; md8c1; md8c1; md2c2


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
