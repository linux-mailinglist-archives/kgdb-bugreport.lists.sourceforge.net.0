Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F47B50097
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  9 Sep 2025 17:03:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ygGcsAaOBPLTS2Z1g0lrWt2CxyVx8pdPmrYnFb/l5+w=; b=a1pTqiO42iUl1o9/MY9V42jjSF
	CN5KPW7C4Zz4jiemzTmiLsIrhxIGoSsWN0bi048W8kzM7Fn0ijPKDj7q69h8TT32h1VUhjLCBHWIq
	FsenhO+VkkETVDk/ljyLERnzSsuD+3F8r63/iNF4YwM02OnanYYIodsyYdKA3X5zFrUc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uvzsc-0004lt-HX
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 09 Sep 2025 15:03:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uvzsb-0004ln-Ie
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 09 Sep 2025 15:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5JCNA5C9ya4Jo5xtjb6FS9fyG6SoJInYHtCloGYGcus=; b=DHGc2Jcs71G159nFnk+jWeRoHa
 n5+/4J3Gg8XAMxEMn08SBoXw8gh5fLynZQET/7ryTny2WDcrchieb7ngVKwu1Ku4Vsb0DwsJt16OI
 DIy458jJmJidZHePcE/crUzMnoahQaFkjYV1zrjI5iG6Nh1X960OsNH6Rt66GYhd8rlI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5JCNA5C9ya4Jo5xtjb6FS9fyG6SoJInYHtCloGYGcus=; b=EB77elHU1gq4Z245WyvCfGMMwl
 d2oQ3egedARE0L1t5uo6GqZdA02gjEBeEgAN0fepTYu/vS9t/1J43xUMCKud9Y3zRN0F6ZeXGCkt4
 0aeLmBYlpb/KPGZbXBtE4YKnt2A7ht6u4ZAdpdtJGR6UjYeFtln/mxdlRuRNiWn8SHR0=;
Received: from mail-ej1-f68.google.com ([209.85.218.68])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uvzsa-00068x-Al for kgdb-bugreport@lists.sourceforge.net;
 Tue, 09 Sep 2025 15:03:33 +0000
Received: by mail-ej1-f68.google.com with SMTP id
 a640c23a62f3a-aff0775410eso200962966b.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 09 Sep 2025 08:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1757430201; x=1758035001; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5JCNA5C9ya4Jo5xtjb6FS9fyG6SoJInYHtCloGYGcus=;
 b=WMoPYwDiXUiReSoHl9Bgjrs4w3ebLpvYRvi7ykF4ESxDFHxCMzhmp+6m0hWoxw/TDC
 gYkP+paKr2AC2aOVuYnRD9wsRFflq01qaUzODY1O9F6awCqNpmN1bM5PQnDvxLhiNGdn
 EgLph9ZEb6e6sfHWiWRznvzkmyxOc58EkOoFN1N1Y3kdB3m7g6TSR4FzBrpqzZkexTmh
 T+9mvg81jo6nHa1L2kRhTEr1Mqjg//EQqZaTZQktbdYTfYWaOw5CIZtyvJvL7Ore5pba
 EhpI5/l51wldeIqza6RnBDa+eFm4AfeBkj5OE7phZbsANsbAp2z0pwLDVqDWYLIyN4BW
 NnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757430201; x=1758035001;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5JCNA5C9ya4Jo5xtjb6FS9fyG6SoJInYHtCloGYGcus=;
 b=QTkIhvk+l56T5g6DBe7Mbyc+KNoMg+2aQuJ9lGxq4zM4Vt30gr02rAqpDRRp5HPJ4P
 AOfWcphrvBVvdXjGQxkq3BaY2Mr5KJCy2/ijdYkYICv7aZHoZxse4vzLo15M60DxIRJw
 tL+1LxHAltT3mW0J0L2gBUmXEgn83S3vZ2Bp0IJyRMlIk2JuptHIUjSgfBEEIJCaTc+3
 BkeJSjVi73ZSzI/VoLp7zZ4chAe0jhZ7V2PID42G6FDefEqHKHELy65ClltnqVu5x8b6
 S0Z0cvWa60/1HXceL0XasiPAu0Yzjc7WHPRaSb23TBg7Dl3J0hiJAmO6SyKVxBAT34iP
 RSdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXybpTdElP7MqwPex3kNvBuTekZLfkHXn4QDFgjdmlmtTQ17pIochw9d5xxA6M99kQQGPh1SW3LdSz+dAti6Q==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzeY+07YMCGbAJq5uxPniDB7HmnCw1aPvQDleZ8V0D7g9F21Ss1
 rd4BO+dJlmcHk5AUyFSbznoAsH2ga4oeblN2uNTrmzq4onj7xvO7e7ilS1xWb/qjd1w=
X-Gm-Gg: ASbGncvWtHHfp+nfMmJ4zIkymmeMvV4ocOM3M2yD2JhaFBk30Y7w6paRhTs4OEpBs/y
 eBMjBnY0UxcVqAdAP3Fuya8Ilf5Hdn4evjn3gurFcXUdkFRwPwIyzPlNCEyD+4UppZLeVX3/R65
 cwpAsDaA8Y6654nHy5HtKGNYx2b73yMKUvlacElHSmJg/PcTSqt/UmW76WGDL7bTHh3EwTEIjhj
 9mUExN9A/qCbzEj28E9oOlGwU+wW1LDoxqEEPNoy9/JR46X4N2U+vt0LCBzrGY+5oHHbFNsO61f
 v9S4E1qCEV0MSmyGFQE1xcwe8odvVGcl+bEd/qDnWW5wJoMm8EmdfEPfNxAXBxwLztV0WNsHNz5
 wuiIHgtYDZ4z1+Md1sPNzHrkZsQ==
X-Google-Smtp-Source: AGHT+IHdxC0JePk3qeMEY0oBAOfP9396mjUVW5jGrhBODN2YmkUTvFgIlwQkSj3Cm41Bms/JnFAwUw==
X-Received: by 2002:a17:907:9691:b0:afe:ed05:2e68 with SMTP id
 a640c23a62f3a-b04930ac043mr1723174666b.11.1757430200254; 
 Tue, 09 Sep 2025 08:03:20 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0783411a3csm3334966b.100.2025.09.09.08.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 08:03:19 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:03:17 +0200
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <aMBBtYK0pIYa_Ba6@pathway.suse.cz>
References: <20250902-nbcon-kgdboc-v3-0-cd30a8106f1c@suse.com>
 <20250902-nbcon-kgdboc-v3-4-cd30a8106f1c@suse.com>
 <aL77aq4gZBsn4epT@pathway.suse.cz>
 <d73e8cc0259c140a0a49f670c6c165bb662281ed.camel@suse.com>
 <84segwjbxq.fsf@jogness.linutronix.de>
 <aMAwMz4vWC5u9OpN@pathway.suse.cz>
 <84h5xbk8ll.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84h5xbk8ll.fsf@jogness.linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 2025-09-09 16:29:50,
 John Ogness wrote: > On 2025-09-09, 
 Petr Mladek <pmladek@suse.com> wrote: > > The problem is that
 wctxt->unsafe_takeover
 would need to get updated > > after acquiring the c [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.68 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uvzsa-00068x-Al
Subject: Re: [Kgdb-bugreport] [PATCH v3 4/4] kdb: Adapt kdb_msg_write to
 work with NBCON consoles
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marcos Paulo de Souza <mpdesouza@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue 2025-09-09 16:29:50, John Ogness wrote:
> On 2025-09-09, Petr Mladek <pmladek@suse.com> wrote:
> > The problem is that wctxt->unsafe_takeover would need to get updated
> > after acquiring the context. And might be reused for different
> > consoles, ...
> 
> You are right. I think it is best to make nbcon_write_context_set_buf()
> available.

I am fine with it.

> > But wait. I do not see any code using wctxt->unsafe_takeover.
> >
> > It seems that the motivation was that console drivers might
> > do something else when there was an unsafe_takeover in the past,
> > see https://lore.kernel.org/lkml/87cyz6ro62.fsf@jogness.linutronix.de/
> > But it seems that no console driver is using it.
> >
> > So, I would prefer to remove the "unsafe_takeover" field from
> > struct nbcon_write_context and keep this kdb code as it is now.
> 
> No one is using it because the nbcon drivers are still implementing the
> "hope and pray" model on unsafe takeovers. The flag is an important part
> of the API to allow drivers to maximize their safety.
> 
> I think it is too early to remove the flag when there are still so few
> nbcon drivers in existance.

I feel that that I should be more strict and push for removing
the flag because it is not used and complicates the design.
I am sure that there are cleaner ways how to provide
the information when anyone would need it.

But I do not want to fight for it. It is not worth a blood
(changing code back and forth). I am fine with exporting
nbcon_write_context_set_buf() for now. We might know more
about real users next time it causes problems ;-)

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
