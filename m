Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 917258061C1
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  5 Dec 2023 23:31:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rAdxN-00064m-0t
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 05 Dec 2023 22:31:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1rAdxM-00064g-Bd
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 05 Dec 2023 22:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UUoV3c5EcqzGgFazFRODspx6X9OPb/ruYMRTuRufHkE=; b=e7X2UdGJnNNy+6Rfuy2KhbxMyh
 W83jVcz9pmfvzh6PKHjNLkTaPj7EZjzw4udhLyaYqAYHhBFZQYxwKwbtsca85hZdqgaw8wojaS5ll
 7Cg6Qi3x25sL5ED+wiYJXEtnSVf3VjHXOyv3Z8dqwEeJ9D3PnzSimhb5H0Bs6awFnV0Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UUoV3c5EcqzGgFazFRODspx6X9OPb/ruYMRTuRufHkE=; b=PUfbMbs8ICyd9R31gXdgNW9tvd
 MDd6KD6H2ho2mGKJFi0G1R9iPRQ5VjFGLuJxQohnMBi5kfJqz37kRY8jZYzBx6dyXZ7TON7Yj9ZL1
 Jnslik6HuQKOvYfslcDoL/fiUiY2nRMCW1zWjDlPllbX5btMYR6kxl13ldJKFrrCiFXU=;
Received: from mail-vs1-f43.google.com ([209.85.217.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rAdxI-0006Bv-8l for kgdb-bugreport@lists.sourceforge.net;
 Tue, 05 Dec 2023 22:31:56 +0000
Received: by mail-vs1-f43.google.com with SMTP id
 ada2fe7eead31-464a3b84ef7so163975137.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 05 Dec 2023 14:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701815501; x=1702420301;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UUoV3c5EcqzGgFazFRODspx6X9OPb/ruYMRTuRufHkE=;
 b=Ho22u45s1m3RQAAbRmYzjRJz7gE6Y3vazzL45S63XWbAJuo8mnpU8BrOgODWMGLWYL
 CJB8fGO/oPZesqn7eKo/dDhSjTMWRci2RKCLeMBGNH5jPpiEo3fMNLgciwyY5E0We9Ao
 QqehuMdhCGLG+JcPn1NZ1RQxSpbOMnaPwxdH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701815501; x=1702420301;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UUoV3c5EcqzGgFazFRODspx6X9OPb/ruYMRTuRufHkE=;
 b=dmtjk4+6y2lQ/gGDSQOIT6AqzQTJFwxYceRR7OR0OqeGQUycaBbhrUXh3z/o8U4myK
 /ymWvctTRZ7w1fj9QnublGiIcxtzQaox3mRezGWnWfszSBnLI8//By9EKPQVxaCEg1we
 zSq58YMPEz+sjByRX/qnewkNKjGGzhqBy7WTJLbSGZK1uinlkRnoj+X18KDw4Neo3UDr
 hOJy15BlH44SFy3p4xdBrrEfiVlvMbs7tW9x+R+8nhU9AkntbTqSzuBFPb5BbAqz+trt
 z8kFkaC4op8qaa505WW/ifVP1+HBEe5LvPrqT1ZTfn8Hxtc3QXePKQxXYLLBU93FWmGI
 20Xg==
X-Gm-Message-State: AOJu0Yy1KUkYucj3qgMvQjIQp3/oTa75PgWAzVFq9dYNDryWdpULUcpo
 NsSG5/9psF8M71GDIkvFgCfUAxHjLZFg5TGpXup62QYw
X-Google-Smtp-Source: AGHT+IFDCRipo1trYFztqlo3CGHoNJfNYIu0g5Vsou+p1dmddC8vsf+aLPIZrYRM+GpLilGglJWZkA==
X-Received: by 2002:ac8:7dca:0:b0:423:74a5:a8e with SMTP id
 c10-20020ac87dca000000b0042374a50a8emr2631813qte.24.1701812521743; 
 Tue, 05 Dec 2023 13:42:01 -0800 (PST)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 f6-20020a05622a114600b0042543fb2537sm3461779qty.26.2023.12.05.13.42.00
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 13:42:01 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-425546ad42fso98891cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 05 Dec 2023 13:42:00 -0800 (PST)
X-Received: by 2002:a05:622a:247:b0:423:babe:75f1 with SMTP id
 c7-20020a05622a024700b00423babe75f1mr7180qtx.17.1701812520401; Tue, 05 Dec
 2023 13:42:00 -0800 (PST)
MIME-Version: 1.0
References: <GV1PR10MB65635561FB160078C3744B5FE8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
 <GV1PR10MB6563E0F8DB2D335BD9CFE4D3E8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <GV1PR10MB6563E0F8DB2D335BD9CFE4D3E8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Dec 2023 13:41:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VZ61XFb1Ks79BHr1jL1jwf_36wYXryy0ZXOz1xTQ9zOg@mail.gmail.com>
Message-ID: <CAD=FV=VZ61XFb1Ks79BHr1jL1jwf_36wYXryy0ZXOz1xTQ9zOg@mail.gmail.com>
To: Yuran Pereira <yuran.pereira@hotmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Sun, Nov 19, 2023 at 4:07 PM Yuran Pereira <yuran.pereira@hotmail.com>
    wrote: > > The simple_str* family of functions perform no error checking
   in > scenarios where the input value overflows the [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.217.43 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.217.43 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rAdxI-0006Bv-8l
Subject: Re: [Kgdb-bugreport] [PATCH 1/2] kdb: Replace the use of
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
 jason.wessel@windriver.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBTdW4sIE5vdiAxOSwgMjAyMyBhdCA0OjA34oCvUE0gWXVyYW4gUGVyZWlyYSA8eXVy
YW4ucGVyZWlyYUBob3RtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgc2ltcGxlX3N0ciogZmFtaWx5
IG9mIGZ1bmN0aW9ucyBwZXJmb3JtIG5vIGVycm9yIGNoZWNraW5nIGluCj4gc2NlbmFyaW9zIHdo
ZXJlIHRoZSBpbnB1dCB2YWx1ZSBvdmVyZmxvd3MgdGhlIGludGVuZGVkIG91dHB1dCB2YXJpYWJs
ZS4KPiBUaGlzIHJlc3VsdHMgaW4gdGhlc2UgZnVuY3Rpb25zIHN1Y2Nlc3NmdWxseSByZXR1cm5p
bmcgZXZlbiB3aGVuIHRoZQo+IG91dHB1dCBkb2VzIG5vdCBtYXRjaCB0aGUgaW5wdXQgc3RyaW5n
Lgo+Cj4gT3IgYXMgaXQgd2FzIG1lbnRpb25lZCBbMV0sICIuLi5zaW1wbGVfc3RydG9sKCksIHNp
bXBsZV9zdHJ0b2xsKCksCj4gc2ltcGxlX3N0cnRvdWwoKSwgYW5kIHNpbXBsZV9zdHJ0b3VsbCgp
IGZ1bmN0aW9ucyBleHBsaWNpdGx5IGlnbm9yZQo+IG92ZXJmbG93cywgd2hpY2ggbWF5IGxlYWQg
dG8gdW5leHBlY3RlZCByZXN1bHRzIGluIGNhbGxlcnMuIgo+IEhlbmNlLCB0aGUgdXNlIG9mIHRo
b3NlIGZ1bmN0aW9ucyBpcyBkaXNjb3VyYWdlZC4KPgo+IFRoaXMgcGF0Y2ggcmVwbGFjZXMgYWxs
IHVzZXMgb2YgdGhlIHNpbXBsZV9zdHJ0byogc2VyaWVzIG9mIGZ1bmN0aW9ucwo+IHdpdGggdGhl
aXIgc2FmZXIga3N0cnRvKiBhbHRlcm5hdGl2ZXMuCj4KPiBTaWRlIGVmZmVjdHMgb2YgdGhpcyBw
YXRjaDoKPiAtIEV2ZXJ5IHN0cmluZyB0byBsb25nIG9yIGxvbmcgbG9uZyBjb252ZXJzaW9uIHVz
aW5nIGtzdHJ0byogaXMgbm93Cj4gICBjaGVja2VkIGZvciBmYWlsdXJlLgo+IC0ga3N0cnRvKiBl
cnJvcnMgYXJlIGhhbmRsZWQgd2l0aCBhcHByb3ByaWF0ZSBgS0RCX0JBRElOVGAgd2hlcmV2ZXIK
PiAgIGFwcGxpY2FibGUuCj4gLSBBIGdvb2Qgc2lkZSBlZmZlY3QgaXMgdGhhdCB3ZSBlbmQgdXAg
c2F2aW5nIGEgZmV3IGxpbmVzIG9mIGNvZGUKPiAgIHNpbmNlIHVubGlrZSBpbiBzaW1wbGVfc3Ry
dG8qIGZ1bmN0aW9ucywga3N0cnRvIGZ1bmN0aW9ucyBkbyBub3QKPiAgIG5lZWQgYW4gYWRkaXRp
b25hbCAiZW5kIHBvaW50ZXIiIHZhcmlhYmxlLCBhbmQgdGhlIHJldHVybiB2YWx1ZXMKPiAgIG9m
IHRoZSBsYXR0ZXIgY2FuIGJlIGRpcmVjdGx5IGNoZWNrZWQgaW4gYW4gImlmIiBzdGF0ZW1lbnQg
d2l0aG91dAo+ICAgdGhlIG5lZWQgdG8gZGVmaW5lIGFkZGl0aW9uYWwgYHJldGAgb3IgYGVycmAg
dmFyaWFibGVzLgo+ICAgVGhpcywgb2YgY291cnNlLCByZXN1bHRzIGluIGNsZWFuZXIsIHlldCBz
dGlsbCBlYXN5IHRvIHVuZGVyc3RhbmQKPiAgIGNvZGUuCj4KPiBbMV0gaHR0cHM6Ly93d3cua2Vy
bmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9kZXByZWNhdGVkLmh0bWwjc2ltcGxlLXN0
cnRvbC1zaW1wbGUtc3RydG9sbC1zaW1wbGUtc3RydG91bC1zaW1wbGUtc3RydG91bGwKPgo+IFNp
Z25lZC1vZmYtYnk6IFl1cmFuIFBlcmVpcmEgPHl1cmFuLnBlcmVpcmFAaG90bWFpbC5jb20+Cj4g
LS0tCj4gIGtlcm5lbC9kZWJ1Zy9rZGIva2RiX21haW4uYyB8IDcwICsrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyks
IDQ5IGRlbGV0aW9ucygtKQoKU29ycnkgZm9yIHRha2luZyBzbyBsb25nIHRvIHJldmlldyB0aGlz
LS1pdCBhcnJpdmVkIGluIG15IGluYm94IGF0IGEKYmFkIHRpbWUuIEEgZmV3IG1pbm9yIG5pdHMg
YmVsb3cgdGhhdCBJIHRoaW5rIHNob3VsZCBiZSBmaXhlZCBiZWZvcmUKbGFuZGluZyBidXQgb3Zl
cmFsbCBJIHRoaW5rIGl0J3MgYSBuaWNlIGNsZWFudXAuIFRoYW5rcyEKCgo+IEBAIC00MTIsNDIg
KzQxMiwyMSBAQCBzdGF0aWMgdm9pZCBrZGJfcHJpbnRlbnYodm9pZCkKPiAgICovCj4gIGludCBr
ZGJnZXR1bGFyZyhjb25zdCBjaGFyICphcmcsIHVuc2lnbmVkIGxvbmcgKnZhbHVlKQo+ICB7Cj4g
LSAgICAgICBjaGFyICplbmRwOwo+IC0gICAgICAgdW5zaWduZWQgbG9uZyB2YWw7Cj4gLQo+IC0g
ICAgICAgdmFsID0gc2ltcGxlX3N0cnRvdWwoYXJnLCAmZW5kcCwgMCk7Cj4gLQo+IC0gICAgICAg
aWYgKGVuZHAgPT0gYXJnKSB7Cj4gLSAgICAgICAgICAgICAgIC8qCj4gLSAgICAgICAgICAgICAg
ICAqIEFsc28gdHJ5IGJhc2UgMTYsIGZvciB1cyBmb2xrcyB0b28gbGF6eSB0byB0eXBlIHRoZQo+
IC0gICAgICAgICAgICAgICAgKiBsZWFkaW5nIDB4Li4uCj4gLSAgICAgICAgICAgICAgICAqLwo+
IC0gICAgICAgICAgICAgICB2YWwgPSBzaW1wbGVfc3RydG91bChhcmcsICZlbmRwLCAxNik7Cj4g
LSAgICAgICAgICAgICAgIGlmIChlbmRwID09IGFyZykKPiArICAgICAgIC8qCj4gKyAgICAgICAg
KiBJZiB0aGUgZmlyc3QgZmFpbHMsIGFsc28gdHJ5IGJhc2UgMTYsIGZvciB1cwo+ICsgICAgICAg
ICogZm9sa3MgdG9vIGxhenkgdG8gdHlwZSB0aGUgbGVhZGluZyAweC4uLgo+ICsgICAgICAgICov
Cj4gKyAgICAgICBpZiAoa3N0cnRvdWwoYXJnLCAwLCB2YWx1ZSkpCj4gKyAgICAgICAgICAgICAg
IGlmIChrc3RydG91bChhcmcsIDE2LCB2YWx1ZSkpCgpOb3QgbmV3IHRvIHlvdXIgcGF0Y2gsIGJ1
dCB0aGUgYWJvdmUgc2VlbXMgbGlrZSBhIHRlcnJpYmxlIGlkZWEgdG8gbWUuCldoYXQgdGhhdCBt
ZWFucyBpcyB0aGF0OgoKa2RiZ2V0dWxhcmcoIjE4IiwgJnZhbHVlKSA9PiB2YWx1ZSBpcyAxOApr
ZGJnZXR1bGFyZygiMTkiLCAmdmFsdWUpID0+IHZhbHVlIGlzIDE5CmtkYmdldHVsYXJnKCIxYSIs
ICZ2YWx1ZSkgPT4gdmFsdWUgaXMgMjYKCkJsZWghIElmIHNvbWVvbmUgd2FudHMgaGV4IHRoZW4g
dGhleSBzaG91bGQgcHV0IHRoZSAweCBmaXJzdC4KCkknZCBzdWdnZXN0IGEgZm9sbG93dXAgcGF0
Y2ggdGhhdCByZW1vdmVzIHRoZSBmYWxsYmFjayBmb3IgdGhlIGxhenkKZm9sa3MuIEhlcmUgYW5k
IGluIHRoZSBuZXh0IGZ1bmN0aW9uLi4uCgoKPiBAQCAtMjA5NSwxNSArMjA3NCwxMSBAQCBzdGF0
aWMgaW50IGtkYl9kbWVzZyhpbnQgYXJnYywgY29uc3QgY2hhciAqKmFyZ3YpCj4gICAgICAgICBp
ZiAoYXJnYyA+IDIpCj4gICAgICAgICAgICAgICAgIHJldHVybiBLREJfQVJHQ09VTlQ7Cj4gICAg
ICAgICBpZiAoYXJnYykgewo+IC0gICAgICAgICAgICAgICBjaGFyICpjcDsKPiAtICAgICAgICAg
ICAgICAgbGluZXMgPSBzaW1wbGVfc3RydG9sKGFyZ3ZbMV0sICZjcCwgMCk7Cj4gLSAgICAgICAg
ICAgICAgIGlmICgqY3ApCj4gKyAgICAgICAgICAgICAgIGlmIChrc3RydG9pbnQoYXJndlsxXSwg
MCwgJmxpbmVzKSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBsaW5lcyA9IDA7Cj4gLSAgICAg
ICAgICAgICAgIGlmIChhcmdjID4gMSkgewo+IC0gICAgICAgICAgICAgICAgICAgICAgIGFkanVz
dCA9IHNpbXBsZV9zdHJ0b3VsKGFyZ3ZbMl0sICZjcCwgMCk7Cj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKCpjcCB8fCBhZGp1c3QgPCAwKQo+ICsgICAgICAgICAgICAgICBpZiAoYXJnYyA+
IDEpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKGtzdHJ0b3VpbnQoYXJndlsyXSwgMCwg
JmFkanVzdCkgfHwgYWRqdXN0IDwgMCkKCk15IGd1dCByZWFjdGlvbiBpcyB0aGF0IHNvbWUgc29y
dCBvZiBidWlsZCBib3QgaXMgZ29pbmcgdG8gY29tZSBhbmQKeWVsbCBhdCB5b3UgYWJvdXQgdGhl
IGFib3ZlIGxpbmUuIEV2ZW4gaWYgaXQgZG9lc24ndCwgaXQncyBhIGJpdApjb25mdXNpbmcuIFlv
dSdyZSBwYXNzaW5nIGEgcG9pbnRlciB0byBhbiBpbnQgaW50byBhIGZ1bmN0aW9uIHRoYXQKZXhw
ZWN0cyBhIHBvaW50ZXIgdG8gYW4gdW5zaWduZWQgaW50LiBNb3N0IHRoaW5ncyBkb24ndCByZWFs
bHkgY2FyZQphYm91dCBzaWduZWQvdW5zaWduZWQsIGJ1dCBJIGNvdWxkIHN3ZWFyIHRoYXQgc29t
ZSBjb21waWxlcnMgZ2V0IG1hZAp3aGVuIHlvdSBzdGFydCB3b3JraW5nIHdpdGggcG9pbnRlcnMg
dG8gdGhvc2UgdHlwZXMuLi4KCkluIGFueSBjYXNlLCBJIHRoaW5rIGV2ZXJ5dGhpbmcgd291bGQg
d29yayBmaW5lIGlmIHlvdSBqdXN0IGNoYW5nZSBpdAp0byBrc3RydG9pbnQoKSwgcmlnaHQ/IEkg
Z3Vlc3MgdGhlIG90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byBjaGFuZ2UgdGhlCnZhcmlhYmxlIHRv
IHVuc2lnbmVkLCBidXQgSSBndWVzcyB0aGF0IGRvZXNuJ3QgbWFrZSBzZW5zZSBzaW5jZSBpdCdz
IGEKbW9kaWZpZXIgdG8gImxpbmVzIiB3aGljaCBpcyBhbiBpbnQuCgpTaWRlIG5vdGU6IEkgZGlk
bid0IGV2ZW4ga25vdyBhYm91dCB0aGUgImFkanVzdCIgYXJndW1lbnQsIHNpbmNlIGl0J3MKbm90
IGluIHRoZSBoZWxwIHRleHQgaW4gdGhlIGNvbW1hbmQgdGFibGUgYmVsb3cuIEkgZ3Vlc3MgdGhh
dCBjb3VsZCBiZQpmaXhlZCBpbiBhIHNlcGFyYXRlIHBhdGNoLgoKbml0OiBJTU8gaWYgeW91IGhh
dmUgbmVzdGVkICJpZiIgc3RhdGVtZW50cyB0aGVuIHRoZSBvdXRlciBvbmUgc2hvdWxkCmhhdmUg
YnJhY2VzLiBBS0E6CgppZiAoYSkgewogIGlmIChiKQogICAgYmxhaCgpOwp9CgppbnN0ZWFkIG9m
OgoKaWYgKGEpCiAgaWYgKGIpCiAgICBibGFoKCk7CgouLi5vciB5b3UgY291bGQgZG8gYmV0dGVy
IGFuZCBqdXN0IGNoYW5nZSBpdCB0bzoKCmlmIChhICYmIGIpCiAgYmxhaCgpOwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1h
aWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
