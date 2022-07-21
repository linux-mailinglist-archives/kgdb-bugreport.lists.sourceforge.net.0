Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A102257D400
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 21 Jul 2022 21:20:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1oEbiL-0005Ox-Mu
	for lists+kgdb-bugreport@lfdr.de; Thu, 21 Jul 2022 19:20:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <torvalds@linuxfoundation.org>) id 1oEbiK-0005Or-Qb
 for kgdb-bugreport@lists.sourceforge.net; Thu, 21 Jul 2022 19:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jrOYLEhcS0420xmVQthPyRSyBJPZ/EqshTnmV/2s3/o=; b=WW5dCpCXx2Ydm5XIcZwjQe5OC4
 SsocEyB+zzFM7L64utISl5LvC9RkTwqAvuzH+VwmIiRFLbjGPXSDPqe5E+NaEu+LdIbmlyCAin9K4
 hNmwTYKI7D2bXyQ6QL9U+nWBk57mvmKEmhhgTER6iJ2NlvW8v8ui0yfqqqfHHuXLErKY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jrOYLEhcS0420xmVQthPyRSyBJPZ/EqshTnmV/2s3/o=; b=OQS+tMkloI5fzSCH/wMvrTAGQ/
 3w3vhllIFDgFddfSD/tLobufxB5x//IQQaWIB+kay5BcpVn/tOs048dMr5jiddxGVAOlTs5paYwYT
 GOdeSConAQH3YBu2tOB4gFcUq5j5ljPDm9Ph2lzD9jDiA89+SxM/RVnYbEOo+tBb3VfU=;
Received: from mail-ej1-f45.google.com ([209.85.218.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1oEbiG-00046q-94
 for kgdb-bugreport@lists.sourceforge.net; Thu, 21 Jul 2022 19:20:01 +0000
Received: by mail-ej1-f45.google.com with SMTP id os14so4849316ejb.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 21 Jul 2022 12:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jrOYLEhcS0420xmVQthPyRSyBJPZ/EqshTnmV/2s3/o=;
 b=HaQMMf/lNG/g52eo3gYTsJdE60j17zx7piC5a1J+s9dbt/vdM1VejF+7jojw+wO3/N
 mtFIH/xngKCKZPh+SVIBBgXN6v7W7wdzeW2e2CK2BamcBsKmAZWsOPsXHqs3z/H7+RLZ
 n0ndHCmXYVLy9DnzwZjQrfJ5qVBMimGwmQAjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jrOYLEhcS0420xmVQthPyRSyBJPZ/EqshTnmV/2s3/o=;
 b=KsmwfhIdnkl31mXB7kME7NmEGBc0j30m8DjAyfkV03dwdT41O0og1Kun6ciEekyWld
 M8cAVU0NgtnLe2sZ2ygwcRqNsoLp6GTDKg8dM0Fh1f6KeHMjxfQmqPQg2RYoHOOP3hBW
 465zqGRV31cp2oNh959xN7Uf/cet2APrUaMe2nm7X1AeyLEsPxW8sM7XnkA5E3Mj9EA8
 EVNHKMkV3GLYJ+oYLCJE9vWa/v33HDe0XHxbWP7/jJ9bCxLiI9Xl+51SjjWVredCcb5O
 ziEFcRHmvsKewsCua4mHYSqPBeLoDqZYrWsxrqQgBMKGT3D4AkdxAMmQBo6krNRrxig7
 eEbw==
X-Gm-Message-State: AJIora91bE68RZ2dV5qG+j0WQPpFf5YsJ0otqXvq+bgeVULFEkU0sfmR
 Dy/SsJW/DlwNTUhMeFyNuyAfu+u4eOGkXOkosMA=
X-Google-Smtp-Source: AGRyM1tsEKrsSDfdBzVb2ahFe+3L3szIbZQL/f/HojwZkKx+fgSJz20rIqMPv6NCK7eDCPOIAPwAow==
X-Received: by 2002:a17:906:8a79:b0:72b:871a:57b7 with SMTP id
 hy25-20020a1709068a7900b0072b871a57b7mr39807111ejc.602.1658425307131; 
 Thu, 21 Jul 2022 10:41:47 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 18-20020a170906311200b00722bc0aa9e3sm1050201ejx.162.2022.07.21.10.41.45
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 10:41:46 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id
 u14-20020a05600c00ce00b003a323062569so1208243wmm.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 21 Jul 2022 10:41:45 -0700 (PDT)
X-Received: by 2002:a05:600c:2211:b0:3a3:2149:88e1 with SMTP id
 z17-20020a05600c221100b003a3214988e1mr9253524wml.8.1658425305550; Thu, 21 Jul
 2022 10:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220721093042.9840-1-khalid.masum.92@gmail.com>
 <CAD=FV=UbRX194rDztr_=eoALg4kTmjzq=EXCX6RJSSq3vO=fbw@mail.gmail.com>
 <Ytl/xkb9OC43dgJd@bombadil.infradead.org>
In-Reply-To: <Ytl/xkb9OC43dgJd@bombadil.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 21 Jul 2022 10:41:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgDsUDBeLWfFXTWSQcAGq9YS5gjMeNe-1KpXmyo_RwG8A@mail.gmail.com>
Message-ID: <CAHk-=wgDsUDBeLWfFXTWSQcAGq9YS5gjMeNe-1KpXmyo_RwG8A@mail.gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 21,
 2022 at 9:33 AM Luis Chamberlain <mcgrof@kernel.org>
 wrote: > > > This should go to Linus prior to the next rc. Linus, I think
 this is > worth picking up now as I smell a final release [...] 
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.45 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.45 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oEbiG-00046q-94
Subject: Re: [Kgdb-bugreport] [PATCH RESEND] scripts/gdb: Fix gdb
 'lx-symbols' command
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
Cc: Khalid Masum <khalid.masum.92@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, Aaron Tomlin <atomlin@redhat.com>,
 Kieran Bingham <kbingham@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Jan Kiszka <jan.kiszka@siemens.com>, Shuah Khan <skhan@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Andrew Morton <akpm@linux-foundation.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Jul 21, 2022 at 9:33 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
>
> This should go to Linus prior to the next rc.  Linus, I think this is
> worth picking up now as I smell a final release soon.

Applied. Thanks,

               Linus


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
