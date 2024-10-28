Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBC89B3A33
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 28 Oct 2024 20:12:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t5V9z-0008Lb-0M
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 28 Oct 2024 19:12:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1t5V9x-0008LU-0m
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 28 Oct 2024 19:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R5Mp+oG6fw51RJspX3eEPAbfvpSkKVhKdPlkTR9F3Y8=; b=Rx9jWeNqg651Ov+HWron5rrhMP
 /VYpcDQnTAPaCHuI6wDt/WkHwTAKQqj4zZeVUSgMic4YPrhcoZ2v7flS8SKaJJ/6hGsAI1CsZbS2+
 lOhqBVIEhKNaoZyk2xQruGsgmfMZUxgr1HyQ2yvBieH/r0uG9iUW5S2EPDfa9WGNgvbc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R5Mp+oG6fw51RJspX3eEPAbfvpSkKVhKdPlkTR9F3Y8=; b=lBUQfr38Mlns7lVUoYLX5iQ1rk
 KHJEH2t662Bn+6QEnYpB0KoOSvTZP48kfMcqUi3Qcl5E/D+Du0olIJZjf4qPCvhQ+iKmEPOYpv/dx
 Yqpei166m/Dl4m7Fc6ci/1H33pNPcA5C9aPuoTJYuHqg3TpdsJezYu6YNFUaKxlyDrwg=;
Received: from mail-lf1-f44.google.com ([209.85.167.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t5V9w-0002hL-0q for kgdb-bugreport@lists.sourceforge.net;
 Mon, 28 Oct 2024 19:12:13 +0000
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-539e690479cso4542741e87.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 28 Oct 2024 12:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730142720; x=1730747520;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R5Mp+oG6fw51RJspX3eEPAbfvpSkKVhKdPlkTR9F3Y8=;
 b=JQcXa1/ZGzlxish6hBxZPQcu7TojiormVP00QVuZrVnKtAqCNu3dUbYkko0tP11m0m
 Km59VpR2g/iWcT/C7/artph6F8WxtbeiElVPUhkvBrmLmgz2zDzV7OBeeSkcN0VMv5Gh
 dDn69xOwedrZ+lGwflYYano8pefw/xzoPrG24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730142720; x=1730747520;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R5Mp+oG6fw51RJspX3eEPAbfvpSkKVhKdPlkTR9F3Y8=;
 b=vPXxacTwl2mXUbktQ0CV+my3L9HfXMxDV7ld1FYJ9LbQ2yYap34hvD1h1AvuZhcB9W
 LsuDi85K0SN1Yxod/bxgb6LrZQe9axCD4xlodb6db70m3XGUVzXtUn6VZCJcTIKD9oQR
 izwFmfzXIaE85irVLcyemBvxGDgLT+ERTqx1apFIoDA3M7TRr2MevftwFI2OAXNQFXYL
 6sdrPChPl391BAzZDskTjVLHhTV6yccaURiAYZlrMTiH+DzQ80FN5VM1fRD3BL4z/9IP
 RxAbbmjjgtTMPh0VklMK1cBA/eb/BLjfpZuOcRSknP125E5nPdZ6e9WGBpLMtzIr54GS
 xkFw==
X-Gm-Message-State: AOJu0Yw7OaViU47UcxQ8uiYiCOSy7mDCZuDSb1VqxzNiQG+VzErskIeC
 9RJ9bn8n2dp0lNGTiGso4+6UmG+YZ7fJok0EwJXtrIfgkZuMs5+Ny2uuS+fYubYhD49ySwuzjs4
 uSA==
X-Google-Smtp-Source: AGHT+IFEdNeooMZdpKU1myQ0l4NYMGoby4DDhM6vUVHRGDKUT6O1rVS6nMYiaTgHD3Hik+TeSpicXg==
X-Received: by 2002:a05:6512:3045:b0:533:d3e:16fe with SMTP id
 2adb3069b0e04-53b3491e270mr4114250e87.38.1730139130089; 
 Mon, 28 Oct 2024 11:12:10 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e1adf10sm1137421e87.131.2024.10.28.11.12.09
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 11:12:09 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2fb3110b964so36567211fa.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 28 Oct 2024 11:12:09 -0700 (PDT)
X-Received: by 2002:a2e:4619:0:b0:2fb:5504:794d with SMTP id
 38308e7fff4ca-2fcbe0bddb9mr33372431fa.44.1730139128714; Mon, 28 Oct 2024
 11:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20241026144724.GA892311@lichtman.org>
 <20241026145417.GA892629@lichtman.org>
In-Reply-To: <20241026145417.GA892629@lichtman.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Oct 2024 11:11:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+YLXs8GugQUhqK9aQM_eRzoJwLc0Yb_OwW9baqHkPKw@mail.gmail.com>
Message-ID: <CAD=FV=X+YLXs8GugQUhqK9aQM_eRzoJwLc0Yb_OwW9baqHkPKw@mail.gmail.com>
To: Nir Lichtman <nir@lichtman.org>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Sat, Oct 26, 2024 at 7:54 AM Nir Lichtman <nir@lichtman.org>
    wrote: > > @@ -2083,15 +2064,10 @@ static int kdb_dmesg(int argc, const char
    **argv) > if (argc > 2) > return KDB_ARGCOUNT; > if (argc [...] 
 
 Content analysis details:   (-0.6 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.44 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.44 listed in wl.mailspike.net]
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5V9w-0002hL-0q
Subject: Re: [Kgdb-bugreport] [PATCH v3 1/3] kdb: Replace the use of
 simple_strto with safer kstrto in kdb_main
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
Cc: daniel.thompson@linaro.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, mhiramat@kernel.org,
 jason.wessel@windriver.com, yuran.pereira@hotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBTYXQsIE9jdCAyNiwgMjAyNCBhdCA3OjU04oCvQU0gTmlyIExpY2h0bWFuIDxuaXJA
bGljaHRtYW4ub3JnPiB3cm90ZToKPgo+IEBAIC0yMDgzLDE1ICsyMDY0LDEwIEBAIHN0YXRpYyBp
bnQga2RiX2RtZXNnKGludCBhcmdjLCBjb25zdCBjaGFyICoqYXJndikKPiAgICAgICAgIGlmIChh
cmdjID4gMikKPiAgICAgICAgICAgICAgICAgcmV0dXJuIEtEQl9BUkdDT1VOVDsKPiAgICAgICAg
IGlmIChhcmdjKSB7Cj4gLSAgICAgICAgICAgICAgIGNoYXIgKmNwOwo+IC0gICAgICAgICAgICAg
ICBsaW5lcyA9IHNpbXBsZV9zdHJ0b2woYXJndlsxXSwgJmNwLCAwKTsKPiAtICAgICAgICAgICAg
ICAgaWYgKCpjcCkKPiArICAgICAgICAgICAgICAgaWYgKGtzdHJ0b2ludChhcmd2WzFdLCAwLCAm
bGluZXMpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGxpbmVzID0gMDsKPiAtICAgICAgICAg
ICAgICAgaWYgKGFyZ2MgPiAxKSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgYWRqdXN0ID0g
c2ltcGxlX3N0cnRvdWwoYXJndlsyXSwgJmNwLCAwKTsKPiAtICAgICAgICAgICAgICAgICAgICAg
ICBpZiAoKmNwIHx8IGFkanVzdCA8IDApCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBhZGp1c3QgPSAwOwo+IC0gICAgICAgICAgICAgICB9Cj4gKyAgICAgICAgICAgICAgIGlmIChh
cmdjID4gMSAmJiAoa3N0cnRvdWludChhcmd2WzJdLCAwLCAmYWRqdXN0KSB8fCBhZGp1c3QgPCAw
KSkKCkJldHdlZW4gdjIgYW5kIHYzIHlvdSByZWdyZXNzZWQuIFRoZSBrc3RydG91aW50KCkgd2Fz
IHN1cHBvc2VkIHRvIGJlCmNoYW5nZWQgdG8ga3N0cnRvaW50KCkgaGVyZS4KCi1Eb3VnCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBv
cnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
