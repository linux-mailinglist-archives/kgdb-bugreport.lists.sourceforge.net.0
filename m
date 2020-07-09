Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3817C21B2CE
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 10 Jul 2020 11:58:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jtpnN-0000s4-Vx
	for lists+kgdb-bugreport@lfdr.de; Fri, 10 Jul 2020 09:58:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jacek.anaszewski@gmail.com>) id 1jtcji-0005a4-H0
 for kgdb-bugreport@lists.sourceforge.net; Thu, 09 Jul 2020 20:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d0gYY+wvsRxBQmwzqJnWeCjIuXvxeaWsWRCnx0ubZOg=; b=AHI+v4R1TwFa34TwdAH7jwzkvT
 5Gd6KtOdlqOh7tCh2cjJkbqum16p8aOrKPVdqOpY48Hbaw0WVrB84F3sBf0aEK+5+YmL0Vq2Q0e+e
 yL6qbKvDbGE1gQU0xCVWD/kRFtZ7Emq3sBf/B3LKLWIj4efiWAg0gJ+IGFcrcML/NQ8M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d0gYY+wvsRxBQmwzqJnWeCjIuXvxeaWsWRCnx0ubZOg=; b=RM11AsQJDh+hHcaB2O7tTDcUDa
 zmVlvckFilP4eT50F+m5+i5hF5S2ngvW4RWP6aLq36eeo0jigh5KbZTsl+oJRB+byWQpTxjJBgAvU
 ksF9G53n/x8Vek9Cmujg27NMnr9FMkJZM3wO4O9vJ19MPX6I7H02uXsBS/E/P326kDgI=;
Received: from mail-ej1-f66.google.com ([209.85.218.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jtcjg-00CUtZ-Nv
 for kgdb-bugreport@lists.sourceforge.net; Thu, 09 Jul 2020 20:01:38 +0000
Received: by mail-ej1-f66.google.com with SMTP id y10so3621512eje.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 09 Jul 2020 13:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d0gYY+wvsRxBQmwzqJnWeCjIuXvxeaWsWRCnx0ubZOg=;
 b=GkZHcqMUxKmjdVenudvdvqrkXbo+JquPTX2QSgtNobUDUV+vraMZmE9cpIcAdHZJUq
 BsNZoufFprGyxI+wF74biz7ZS11pt7kce+6MsuFWiTDxGPiFDCBKH/FQV0TSZY+pJnKZ
 aQgYU21P8pRSAHEIpMjQaSk+/2UWcXpEmWTHqU2pnGGc+WJE2vTWQaeOqT9pS6Wvbnc+
 FHkBOL1YGb2IRejD/iE8bAHlYDJJb7i6xs3ZqMC0TUpFxaYPBos1PzAaPH3oFvaWN425
 C2K8MZOf+/7LZ1SzGQPQTHQjCyQFHQkVSe9p2Uwwgk+FPt9rtQwguKi6C2OAdfptqC2j
 oImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d0gYY+wvsRxBQmwzqJnWeCjIuXvxeaWsWRCnx0ubZOg=;
 b=E/hfxTztku+Qr/sz9E9h5eVRWMaTZpWrEfxObgSYmTbzzyfk6n8d8D6AVxG68LVqfx
 lolrFxvh7bZ5nBFP7HUnUzdk4FehP/c/4C2fzYYQjq+NmHjisiS2iJ2wZWD4eOTMnBko
 qA07C3TGrT5g2sLIz0kF5sjYRiZ8mIWok8ecLkmDAWT+e29oSQI/eTVGAzTP57x6RB+U
 +Hvp97Oo7yLmSiddwFzMYT9u+uEpguGf4AZvi6SQ4j8oJm1BxY6p99zNlyAGWvgQo6m8
 Nm7jdQev3dAnJUC/DnyAO198vhBbF8umvFYE3OHhNEIDPDYmknT8qSI6gjoxHJ41fL57
 S01A==
X-Gm-Message-State: AOAM533BwgVRGKECTbl61PQ0th1SyjNSuSdWCJ7/4IQeM8bZjzwn4vUV
 jrqaESWGQ0ZLaF1X2VHBV50=
X-Google-Smtp-Source: ABdhPJxPlnTPprrTFBMP+KVIniKNlWppnSrNKOcRmi8sX8QVrNf9GjrPlFc+WTiAQakw0xXsLbAzEQ==
X-Received: by 2002:a17:906:3a04:: with SMTP id
 z4mr51246240eje.441.1594324883183; 
 Thu, 09 Jul 2020 13:01:23 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:2066:8db:696f:8073?
 ([2a01:110f:b59:fd00:2066:8db:696f:8073])
 by smtp.gmail.com with ESMTPSA id t2sm2728139eds.60.2020.07.09.13.01.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2020 13:01:22 -0700 (PDT)
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-12-rdunlap@infradead.org>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <16035116-2154-d0fe-6655-a829a9d36ceb@gmail.com>
Date: Thu, 9 Jul 2020 22:01:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200707180414.10467-12-rdunlap@infradead.org>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: ti.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (jacek.anaszewski[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.218.66 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jtcjg-00CUtZ-Nv
X-Mailman-Approved-At: Fri, 10 Jul 2020 09:58:16 +0000
Subject: Re: [Kgdb-bugreport] [PATCH 11/20] Documentation:
 leds/ledtrig-transient: eliminate duplicated word
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
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 kgdb-bugreport@lists.sourceforge.net, linux-fpga@vger.kernel.org,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 keyrings@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-i2c@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-scsi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Halil Pasic <pasic@linux.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Wang <james.qian.wang@arm.com>, linux-input@vger.kernel.org,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Wu Hao <hao.wu@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>,
 Hannes Reinecke <hare@suse.com>, linux-block@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dan Murphy <dmurphy@ti.com>,
 linux-mm@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Jens Axboe <axboe@kernel.dk>, Michal Marek <michal.lkml@markovi.net>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Wolfram Sang <wsa@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Jason Wessel <jason.wessel@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 7/7/20 8:04 PM, Randy Dunlap wrote:
> Drop the doubled word "for".
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: linux-leds@vger.kernel.org
> ---
>   Documentation/leds/ledtrig-transient.rst |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20200701.orig/Documentation/leds/ledtrig-transient.rst
> +++ linux-next-20200701/Documentation/leds/ledtrig-transient.rst
> @@ -157,7 +157,7 @@ repeat the following step as needed::
>   	echo 1 > activate - start timer = duration to run once
>   	echo none > trigger
>   
> -This trigger is intended to be used for for the following example use cases:
> +This trigger is intended to be used for the following example use cases:
>   
>    - Control of vibrate (phones, tablets etc.) hardware by user space app.
>    - Use of LED by user space app as activity indicator.
> 

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
