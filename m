Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2118857BF
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 21 Mar 2024 12:04:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rnGDi-0001Ju-5r
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 21 Mar 2024 11:04:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rnGDh-0001Jo-A7
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 21 Mar 2024 11:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a0TlLN0BMwnJ+UpSK4jvuBdM2+J+Dj1/xcdLP2bxFwM=; b=BoV75onGFwmjeK/Bl40UuFuA9M
 E+u+YeL8sFu5Cp1C8NfxnUzPLGXHYXZ2vfQTCeb/NaWzvtbhfLaZ63ZrySb0KXzyYNPv9P9e+3anQ
 N7moLltE44LAmp5juqJ3RAxLdAftd1o8hRMo40rnEBx521iC1BmUwVOhiNykYecKUqbo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a0TlLN0BMwnJ+UpSK4jvuBdM2+J+Dj1/xcdLP2bxFwM=; b=EHlIMhLZR1e+OB/b9Vx480ukHT
 vVw7YSoP0nPa1nBF0f5YK23LKihu+msa3G0WcdiKZ+5qakigcnaVTIznBBg80vmLdzl4HNSk1l5gV
 p62Gm8199gny2GZZRKIGjDNJhjfKt8VPymjdvbj0crtrHLim47Pgm0BzqHwzZOQubmkk=;
Received: from mail-lf1-f49.google.com ([209.85.167.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rnGDd-0000cz-0q for kgdb-bugreport@lists.sourceforge.net;
 Thu, 21 Mar 2024 11:04:25 +0000
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-513da1c1f26so1131860e87.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 21 Mar 2024 04:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711019049; x=1711623849; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=a0TlLN0BMwnJ+UpSK4jvuBdM2+J+Dj1/xcdLP2bxFwM=;
 b=q9/3lxdhWJsROi9YUkDDzPHycc/gULy+0LVNI/Ghl350XnF/BC+p+F0qtjoxR0t9qg
 56Gg8C5+avHDc+ZltwonCOPGOVcQz0cQgmloSqsaUSyACtNa7ybm+eybb3Hwnzc40P2D
 Bo9+TQAvC/YdzlygUUygUwJVoZ7mYWKYGPHw4hwXlMORG4rJTSCsxw00sBVOBvs4EOsB
 d5GZJ/lY5dmNVonnubxeTiZVROP5CVRKESiaKxYGQzqwdGdOF7eJbPgYZ89w+49Xj2yC
 PQkSBIS9qksOwgdum3TzMprUvfF2KqS1NHbUhbs8+X+353aGOkGePTJDc2vkcJJcChKP
 bwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711019049; x=1711623849;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a0TlLN0BMwnJ+UpSK4jvuBdM2+J+Dj1/xcdLP2bxFwM=;
 b=pEeMS8GUtiPPIC6GihhA91F4F0E0ztyDW/p6RwFQfHhpG9ka3OaV9ppmr8eXissU7C
 JHMw34keDnbwUqJ97URERtPFUbpwCmOayv0Y5fcJNCjdYyYDP2rxPjEpCt5AI5EO/6UZ
 L6Hu8t+j7HHUGh5MKkCPjJyVX4CEu0BEw3AS/cRMe1VodBcuyoOlWYN1TkiDTEuTS3ZU
 W2wg6lwpvBLzZEjmDKfQcGoJz7bN7VdVFiyKnYooM2d9PmsrHBtiLlpJE0o1xsTf5JZa
 vX5Q42FPb1BIlOyHdwipZtmPAQ9tSe/T8ST/X5mBe2CJh75JI/KaavooQhiiagJE91up
 xXIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUet5hCdTE1fJf6141kmB03LGfkFzOUou7/yulJe0KUAQ+QvUFEwExwczXpFWeq4i9AEKoip0n3oIFQMZ9A0Q/QfZyTOF5HOinAfXXmvhD54VvgCc4=
X-Gm-Message-State: AOJu0YyZjqctmmIojEjFOh7yH4ohvnBmGUfGOoRjG88yZfiLW5DoT6D3
 QDCFrmxM61KndP4L29H16s8iqGhIpmIEowTiHv0xPQiKlrM2lyA5glYbEiLQyxo=
X-Google-Smtp-Source: AGHT+IEqisjMLI8hi5BcvMJ9JSYdKJ4s9qTck9CnSoGjSt4euGRQ1UsKn6uxN86qyPFuWIy/k85Umg==
X-Received: by 2002:ac2:5a0a:0:b0:513:cf73:d8d2 with SMTP id
 q10-20020ac25a0a000000b00513cf73d8d2mr11555976lfn.54.1711019049329; 
 Thu, 21 Mar 2024 04:04:09 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a05600c4ec800b0041408451874sm5225401wmq.17.2024.03.21.04.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 04:04:08 -0700 (PDT)
Date: Thu, 21 Mar 2024 11:04:07 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Liuye <liu.yeC@h3c.com>
Message-ID: <20240321110407.GB7342@aspen.lan>
References: <20240320162802.GA22198@aspen.lan>
 <20240321022604.4088438-1-liu.yec@h3c.com>
 <2024032137-parrot-sandbank-ab29@gregkh>
 <3cb0b32b8b4946efb93ce68729d4c321@h3c.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3cb0b32b8b4946efb93ce68729d4c321@h3c.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Mar 21, 2024 at 07:57:28AM +0000, Liuye wrote: > >
 > The stack trace below shows an example of the problem. In this case > >
 the master cpu is not running from NMI but it has parked the slave [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.49 listed in wl.mailspike.net]
X-Headers-End: 1rnGDd-0000cz-0q
Subject: Re: [Kgdb-bugreport] 
 =?utf-8?b?562U5aSNOiBbUEFUQ0ggVjNdIGtkYjogRml4?=
 =?utf-8?q?_the_deadlock_issue_in_KDB_debugging=2E?=
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
Cc: "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "jason.wessel@windriver.com" <jason.wessel@windriver.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "jirislaby@kernel.org" <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Mar 21, 2024 at 07:57:28AM +0000, Liuye wrote:
>
> > The stack trace below shows an example of the problem. In this case
> > the master cpu is not running from NMI but it has parked the slave
> > CPUs using an NMI and the parked CPUs is holding spinlocks needed by
> > schedule_work().
>
> Add description information
>
> > Signed-off-by: LiuYe <liu.yeC@h3c.com>
> > Co-authored-by: Daniel Thompson <daniel.thompson@linaro.org>
> > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
>
> Add
> Co-authored-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>

I assume this reply is summarizing what changed between the previous
version and v3?

The best way to add the changelog requested by Greg's bot is to send
a corrected v4 version. If you follow the example in
https://docs.kernel.org/process/submitting-patches.html#the-canonical-patch-format
then you'll see that what is expected.

You can use git-notes to handle this. If you add a note containing
something like the following:
~~~
Changes in v4:
* Provide these changelogs.

Changes in v3:
* <please describe changes>

Changes in v2:
* <please describe changes>
~~~

Once you have the note than git-format-patch --notes will automatically
included the changelog with the patch.


Daniel.


PS I know that v2 was circulated with an incorrect subject line but I
   think it is probably OK to call it v2 anyway... it makes the
   changelog clearer!


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
