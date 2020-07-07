Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E35E2176B5
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  7 Jul 2020 20:29:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jssL6-0001qi-Sb
	for lists+kgdb-bugreport@lfdr.de; Tue, 07 Jul 2020 18:29:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jssL4-0001qa-Kv
 for kgdb-bugreport@lists.sourceforge.net; Tue, 07 Jul 2020 18:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oM1DHY6yXzcZ+72qIs7pzRLVNbxrBF/RvTQpZ6AZWzE=; b=JBam5EI5dgf0Ko6TfDV481rq0m
 lc3dPJxP1x/kI9KFpZex/GSkU97+TzHJSrALkAkI744tHT5BG1tRehX1MFX3l7wgVvAfctJTeuE+8
 i1B+mefuFRHCdwBXV++ATXnnKfJwvE6sBI+Xlq+aGs+3av+JGc4FWB91ZflAEHgKEj1Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oM1DHY6yXzcZ+72qIs7pzRLVNbxrBF/RvTQpZ6AZWzE=; b=PFJPH6VWbLt0srZsFXiM2cVV0Y
 u/g6uQi7PGKfB+uwD7anmMdRYcOaZxBw1m2BijF80763668vrxmB5j0a38RvM747ON5DM2XYIl2y4
 6Uf9Hg4OxhmYPyrwy73eAm1CJ6XuoSlPRcD1c41C6ndsy07XfB2r08OxxNVuYvi5RkYI=;
Received: from mail-qk1-f196.google.com ([209.85.222.196])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jssL1-00DSpS-71
 for kgdb-bugreport@lists.sourceforge.net; Tue, 07 Jul 2020 18:29:06 +0000
Received: by mail-qk1-f196.google.com with SMTP id j80so39092825qke.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 07 Jul 2020 11:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oM1DHY6yXzcZ+72qIs7pzRLVNbxrBF/RvTQpZ6AZWzE=;
 b=PhkRMCL0cOBM87z2xbKJgL3CzSg3isYeGP+IA1EMLxsIahQd9L+L+LwGrIZc7PupVR
 a64FI53GElPSGAoW7S4KRbWMtj7ZzQU/d6kavHWjiCkTTGRsPczF/Nc5eMops5qwua9F
 jGZbXWfjJB1ippmdWlpUMxsElo+5ounp092ew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oM1DHY6yXzcZ+72qIs7pzRLVNbxrBF/RvTQpZ6AZWzE=;
 b=UORoqCd2KTrtlB2anb9tEFJp01A7Plr+TVL9hWORRg7l4TJbV4ZZzvbnZtOSreS2YQ
 YwLQJ010UWuGKLmYq40x4kJo29msTe6ZLwOaVuGxi8h49+Sn0kvHhexRh/bvMzZq8QSL
 ez0mZHL+gl318dKW/L3WCI48nhm1cSp3bWv5tMBqPWUiq9EfQKVyuwvVgCdWnV2whe2B
 8SwARMYxfGyLMwv7Fy0ItY9ixiglOuwGH8s4mgMBJQw3oItVIN5UmuocT+Wuf38cpNKa
 G12kON/23fYAj/hKyg6RF00Zm7cg7zMH42nJHvYLPtfRA3Keaa0C8x2hEEmcNv34B3v7
 t2VA==
X-Gm-Message-State: AOAM5337l2rbFV7jcAtuPMlJG+0RNTzVfvdcyydJ40xPqI7qTek0l2Xw
 1UJn4cBqeddmcq88iZguZRikbirc+cw=
X-Google-Smtp-Source: ABdhPJw1/dNBCNomHjVdoFwoiUYa3twhQYP3RGUVfu7/fOtNtQMQ7CyTDPi6VbZv3vKLE1xO9x6l6w==
X-Received: by 2002:a02:ce9a:: with SMTP id y26mr29458033jaq.121.1594146075057; 
 Tue, 07 Jul 2020 11:21:15 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com.
 [209.85.166.46])
 by smtp.gmail.com with ESMTPSA id a73sm13662259ill.83.2020.07.07.11.21.13
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2020 11:21:14 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id v6so30556158iob.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 07 Jul 2020 11:21:13 -0700 (PDT)
X-Received: by 2002:a5e:a60d:: with SMTP id q13mr32158974ioi.199.1594146071871; 
 Tue, 07 Jul 2020 11:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-5-rdunlap@infradead.org>
In-Reply-To: <20200707180414.10467-5-rdunlap@infradead.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 Jul 2020 11:21:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UkyZcjziOXSYkcPOdkLBJCfxrVAHUq0SfybXXJ3pQxRg@mail.gmail.com>
Message-ID: <CAD=FV=UkyZcjziOXSYkcPOdkLBJCfxrVAHUq0SfybXXJ3pQxRg@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.196 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.196 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jssL1-00DSpS-71
Subject: Re: [Kgdb-bugreport] [PATCH 04/20] Documentation: kgdb: eliminate
 duplicated word
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
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-mips <linux-mips@vger.kernel.org>, Paul Cercueil <paul@crapouillou.net>,
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
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>,
 Hannes Reinecke <hare@suse.com>, linux-block <linux-block@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-mm@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Jens Axboe <axboe@kernel.dk>, Michal Marek <michal.lkml@markovi.net>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Pierre Morel <pmorel@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jason Wessel <jason.wessel@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-integrity@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Mike Rapoport <rppt@kernel.org>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Tue, Jul 7, 2020 at 11:05 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Drop the doubled word "driver".
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: kgdb-bugreport@lists.sourceforge.net
> ---
>  Documentation/dev-tools/kgdb.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
